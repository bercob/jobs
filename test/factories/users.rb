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
  end
end