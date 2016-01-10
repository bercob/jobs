# == Schema Information
#
# Table name: offers
#
#  id                :integer          not null, primary key
#  external_offer_id :string
#  offerdate         :date
#  last_update       :datetime
#  position          :string
#  location          :string
#  content           :string
#  url               :string
#  company           :string
#  ico               :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  offer_source_id   :integer
#
# Indexes
#
#  index_offers_on_external_offer_id  (external_offer_id)
#  index_offers_on_offer_source_id    (offer_source_id)
#

require 'test_helper'

class OfferTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
