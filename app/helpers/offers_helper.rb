require 'open-uri'

module OffersHelper
  def url_with_protocol(url)
    /^http/i.match(url) ? url : "http://#{url}"
  end

  def self.get_external_offers
    doc = Nokogiri::XML(open('https://www.profesia.sk/partner/export.php?auth=241c54637eb11777b50d6ba7e9c29eba')) do |config|
      config.options = Nokogiri::XML::ParseOptions::STRICT | Nokogiri::XML::ParseOptions::NONET
    end

    @offers = doc.xpath('//export//list//offer')
    profesia_source = OfferSource.find_by(name: 'profesia.sk')
    external_offer_ids = ''
    offer_ids = ''
    @offers.each do |offer|
      new_offer = Offer.find_or_initialize_by(external_offer_id: offer['id'], offer_source_id: profesia_source.id)
      new_offer.offerdate = offer.xpath('offerdate')[0]['value']
      new_offer.last_update = offer.xpath('last_updated').text
      new_offer.position = offer.xpath('position').text
      new_offer.location = offer.xpath('location').text
      new_offer.content = offer.xpath('content').text
      new_offer.url = offer.xpath('url').text
      new_offer.company = offer.xpath('company').text
      new_offer.ico = offer.xpath('ico').text
      new_offer.offer_source_id = profesia_source.id
      new_offer.save
      offer.xpath('offercategories//offercategory').each do |oc|
        new_oc = Offercategory.find_or_create_by(name: oc.text)
        OffercategoriesOffer.find_or_create_by(offer_id: new_offer.id, offercategory_id: new_oc.id)
      end
      offer.xpath('jobtypes//jobtype').each do |jt|
        new_jt = Jobtype.find_or_create_by(name: jt.text)
        JobtypesOffer.find_or_create_by(offer_id: new_offer.id, jobtype_id: new_jt.id)
      end
      offer.xpath('offerpositions//offerposition').each do |op|
        new_op = Offerposition.find_or_create_by(name: op.text)
        OfferpositionsOffer.find_or_create_by(offer_id: new_offer.id, offerposition_id: new_op.id)
      end
      offer.xpath('offerregions//offerregion').each do |oreg|
        new_or = Offerregion.find_or_create_by(name: oreg.text)
        OfferregionsOffer.find_or_create_by(offer_id: new_offer.id, offerregion_id: new_or.id)
      end
      external_offer_ids += "'#{new_offer.external_offer_id}',"
      offer_ids += "'#{new_offer.id}',"
    end
    Offer.delete_all "offer_source_id = #{profesia_source.id} AND external_offer_id NOT IN (#{external_offer_ids[0,external_offer_ids.length - 1]})"
    OffercategoriesOffer.delete_all "offer_id NOT IN (#{offer_ids[0,offer_ids.length - 1]}) AND offer_id NOT IN (SELECT id FROM #{Offer.table_name} WHERE offer_source_id != #{profesia_source.id})"
    JobtypesOffer.delete_all "offer_id NOT IN (#{offer_ids[0,offer_ids.length - 1]}) AND offer_id NOT IN (SELECT id FROM #{Offer.table_name} WHERE offer_source_id != #{profesia_source.id})"
    OfferpositionsOffer.delete_all "offer_id NOT IN (#{offer_ids[0,offer_ids.length - 1]}) AND offer_id NOT IN (SELECT id FROM #{Offer.table_name} WHERE offer_source_id != #{profesia_source.id})"
    OfferregionsOffer.delete_all "offer_id NOT IN (#{offer_ids[0,offer_ids.length - 1]}) AND offer_id NOT IN (SELECT id FROM #{Offer.table_name} WHERE offer_source_id != #{profesia_source.id})"
  end
end
