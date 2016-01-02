class AddOfferSourceRefToOffers < ActiveRecord::Migration
  def change
    add_reference :offers, :offer_source, index: true, foreign_key: true
  end
end
