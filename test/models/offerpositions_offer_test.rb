# == Schema Information
#
# Table name: offerpositions_offers
#
#  offer_id         :integer
#  offerposition_id :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_offerpositions_offers_on_offer_id_and_offerposition_id  (offer_id,offerposition_id) UNIQUE
#

require 'test_helper'

class OfferpositionsOfferTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
