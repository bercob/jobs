require 'open-uri'

class Cron < ActiveRecord::Base

  def self.get_external_offers
    doc = Nokogiri::XML(open('https://www.profesia.sk/partner/export.php?auth=241c54637eb11777b50d6ba7e9c29eba')) do |config|
      config.options = Nokogiri::XML::ParseOptions::STRICT | Nokogiri::XML::ParseOptions::NONET
    end

    @offers = doc.xpath('//export//list//offer')
    profesia_source = OfferSource.find_by(name: 'profesia.sk')
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
    end
  end
end