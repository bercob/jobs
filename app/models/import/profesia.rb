require 'open-uri'
module Import
  class Profesia

    def initialize
      @url = Rails.application.config_for(:profesia)['api_url']
    end

    def import!
      xml_page = open @url
      xml_doc = Nokogiri::XML(xml_page) do |config|
        config.options = Nokogiri::XML::ParseOptions::STRICT | Nokogiri::XML::ParseOptions::NONET
      end


      profesia_source = OfferSource.profesia
      external_offer_ids = []

      @offers = xml_doc.xpath('//export//list//offer')
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

        external_offer_ids << new_offer.external_offer_id
      end

      profesia_source.offers.where.not(external_offer_id: external_offer_ids).destroy_all

    end
  end
end