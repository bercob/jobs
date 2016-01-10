# == Schema Information
#
# Table name: languages
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_languages_on_name  (name) UNIQUE
#

class Language < ActiveRecord::Base
  has_and_belongs_to_many :users

  validates :name, presence: true, uniqueness: true
end
