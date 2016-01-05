require 'open-uri'

class StaticPagesController < ApplicationController
  def home
    OffersHelper.get_external_offers
    @offers = Offer.order('offerdate desc').all
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
