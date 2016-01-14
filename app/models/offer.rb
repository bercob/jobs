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

class Offer < ActiveRecord::Base

  belongs_to :offer_source

  has_and_belongs_to_many :jobtypes
  has_and_belongs_to_many :offercategories
  has_and_belongs_to_many :offerpositions
  has_and_belongs_to_many :offerregions

  before_save :generate_timestamp
  before_save :set_external_offer_id
  validates :position, presence: true

  scope :by_offerdate, -> { order 'offerdate' }
  scope :by_company, -> (company) { where 'company = ?', company}

  #enum offer_source: ['local', 'profesia.sk']

  def generate_timestamp
    if self.offer_source_id == OfferSource.local.id
      self.last_update = Time.zone.now
    end
  end

  def set_external_offer_id
    if self.offer_source_id == OfferSource.profesia.id && self.external_offer_id.present? == false
      self.external_offer_id = 'not_set'
    end
  end

end
