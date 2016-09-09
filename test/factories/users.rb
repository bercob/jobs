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
#  degree_id        :integer
#
# Indexes
#
#  index_users_on_degree_id  (degree_id)
#  index_users_on_email      (email) UNIQUE
#

FactoryGirl.define do
  factory :user do
    factory :user_na do
      email 'user@example.com'
      password 'user'
    end

    factory :user_admin do
      email 'admin@example.com'
      password 'admin'
      admin true
    end

    factory :user_new do
      email 'new@test.sk'
      password 'password'
      password_confirmation 'password'
    end

    factory :john_doe do
      email 'john.doe@example.com'
      password 'password'
      password_confirmation 'password'
    end
  end
end
