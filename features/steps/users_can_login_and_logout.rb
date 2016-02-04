class Spinach::Features::UsersCanLoginAndLogout < Spinach::FeatureSteps
  include CommonSteps::Visits

  step 'An user exists' do
    @user = FactoryGirl.create :user_na
    @user_attributes = FactoryGirl.attributes_for(:user_na)
  end

  step 'An Admin user exists' do
    @admin = FactoryGirl.create :user_admin
    @admin_attributes = FactoryGirl.attributes_for(:user_admin)
  end

  step 'I enter wrong credentials' do
    fill_in 'user[email]', with: 'wrong@email.com'
    fill_in 'user[password]', with: 'wrongPassword'
  end

  step 'I enter correct credentials' do
    fill_in 'user[email]', with: @user.email
    fill_in 'user[password]', with: @user_attributes[:password]
  end

  step 'I click on "Login"' do
    page.find('#btn_login').click
  end

  step 'I should see message "Login failed"' do
    page.has_content?('Login failed').must_equal true
  end

  step 'I should see message "Login successful"' do
    page.has_content?('Login successful').must_equal true
  end

  step 'The page should be the login page' do
    current_url.must_include 'login'
  end

  step 'The page should be the users page' do
    current_url.must_include 'users'
  end
end