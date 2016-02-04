module CommonSteps
  module Login
    include Spinach::DSL

    before do
      @admin_attributes = FactoryGirl.attributes_for(:user_admin)
    end

    step 'I log in as an admin' do
      visit :login
      fill_in 'user[email]', with: @admin_attributes[:email]
      fill_in 'user[password]', with: @admin_attributes[:password]
      page.find('#btn_login').click
      page.has_content?('Login successful').must_equal true
    end

  end
end
