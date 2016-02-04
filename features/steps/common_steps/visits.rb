module CommonSteps
  module Visits
    include Spinach::DSL

    step 'I visit the login page' do
      visit :login
    end

    step 'I visit new user page' do
      visit new_user_path
    end

    step 'I visit users page' do
      visit users_path
    end

  end
end
