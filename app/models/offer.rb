class Offer < ActiveRecord::Base
  belongs_to :offer_source
  before_save :generate_timestamp
  validates :position, presence: true

  def generate_timestamp
    if self.offer_source == OfferSource.find_by(name: 'local')
      self.last_update = DateTime.now
    end
  end
end
