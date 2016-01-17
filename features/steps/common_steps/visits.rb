module CommonSteps
  module Visits
    include Spinach::DSL

    step 'I visit the login page' do
      visit :login
    end

  end
end