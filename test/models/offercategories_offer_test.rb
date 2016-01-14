# == Schema Information
#
# Table name: offercategories_offers
#
#  offer_id         :integer          not null
#  offercategory_id :integer          not null
#
# Indexes
#
#  index_offercategories_offers_on_offer_id_and_offercategory_id  (offer_id,offercategory_id) UNIQUE
#

require 'test_helper'

class OffercategoriesOfferTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
