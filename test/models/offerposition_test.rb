# == Schema Information
#
# Table name: offerpositions
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_offerpositions_on_name  (name) UNIQUE
#

require 'test_helper'

class OfferpositionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
