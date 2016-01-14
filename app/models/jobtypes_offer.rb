# == Schema Information
#
# Table name: jobtypes_offers
#
#  offer_id   :integer
#  jobtype_id :integer
#
# Indexes
#
#  index_jobtypes_offers_on_offer_id_and_jobtype_id  (offer_id,jobtype_id) UNIQUE
#

class JobtypesOffer < ActiveRecord::Base
end
