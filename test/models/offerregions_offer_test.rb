# == Schema Information
#
# Table name: offerregions_offers
#
#  offer_id       :integer
#  offerregion_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_offerregions_offers_on_offer_id_and_offerregion_id  (offer_id,offerregion_id) UNIQUE
#

require 'test_helper'

class OfferregionsOfferTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end