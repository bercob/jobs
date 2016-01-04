require 'open-uri'

class StaticPagesController < ApplicationController
  def home
    Cron.get_external_offers
    doc = Nokogiri::XML(open('https://www.profesia.sk/partner/export.php?auth=241c54637eb11777b50d6ba7e9c29eba')) do |config|
      config.options = Nokogiri::XML::ParseOptions::STRICT | Nokogiri::XML::ParseOptions::NONET
    end

    @offers = doc.xpath('//export//list//offer')
  end

  def contact
  end

  def about
  end

  def customer_services
  end

  def services_for_applicants
  end

  def reference
  end
end
