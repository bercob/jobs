# == Schema Information
#
# Table name: offerregions_offers
#
#  offer_id       :integer          not null
#  offerregion_id :integer          not null
#
# Indexes
#
#  index_offerregions_offers_on_offer_id_and_offerregion_id  (offer_id,offerregion_id) UNIQUE
#

class OfferregionsOffer < ActiveRecord::Base

end
