# == Schema Information
#
# Table name: offer_sources
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_offer_sources_on_name  (name) UNIQUE
#

require 'test_helper'

class OfferSourceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
