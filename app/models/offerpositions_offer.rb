# == Schema Information
#
# Table name: offerpositions_offers
#
#  offer_id         :integer          not null
#  offerposition_id :integer          not null
#
# Indexes
#
#  index_offerpositions_offers_on_offer_id_and_offerposition_id  (offer_id,offerposition_id) UNIQUE
#

class OfferpositionsOffer < ActiveRecord::Base
end
