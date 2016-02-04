module CommonSteps
  module Users
    include Spinach::DSL

    step 'An Admin user exists' do
      FactoryGirl.create :user_admin
    end
  end
end
