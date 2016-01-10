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

class Degree < ActiveRecord::Base
  has_many :users

  validates :name, presence: true, uniqueness: true
end
