# == Schema Information
#
# Table name: offercategories
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_offercategories_on_name  (name) UNIQUE
#

class Offercategory < ActiveRecord::Base
  has_and_belongs_to_many :offers

  validates :name, presence: true, uniqueness: true
end
