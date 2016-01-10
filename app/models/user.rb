# == Schema Information
#
# Table name: users
#
#  id               :integer          not null, primary key
#  email            :string           not null
#  crypted_password :string
#  salt             :string
#  created_at       :datetime
#  updated_at       :datetime
#  admin            :boolean
#  degree           :integer
#
# Indexes
#
#  index_users_on_degree_id  (degree_id)
#  index_users_on_email      (email) UNIQUE
#

class User < ActiveRecord::Base
  authenticates_with_sorcery!

  belongs_to :degree
  has_and_belongs_to_many :languages

  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/ }
  validates :password, presence: true, on: :create
  validates :password, confirmation: true
end