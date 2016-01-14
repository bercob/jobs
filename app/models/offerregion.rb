# == Schema Information
#
# Table name: offerregions
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_offerregions_on_name  (name) UNIQUE
#

class Offerregion < ActiveRecord::Base
  has_and_belongs_to_many :offers

  validates :name, presence: true, uniqueness: true

  scope :by_name, -> { order 'name asc' }
end
