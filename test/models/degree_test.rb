# == Schema Information
#
# Table name: degrees
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_degrees_on_name  (name) UNIQUE
#

require 'test_helper'

class DegreeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
