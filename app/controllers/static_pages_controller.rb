class StaticPagesController < ApplicationController
  def home
    Import::Profesia.new.import!
    @offers = Offer.by_offerdate
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
