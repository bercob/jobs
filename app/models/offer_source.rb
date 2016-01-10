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

class OfferSource < ActiveRecord::Base
  has_many :offers

  validates :name, presence: true, uniqueness: true

  def self.profesia
    find_by name: 'profesia.sk'
  end

  def self.local
    find_by name: 'local'
  end
end