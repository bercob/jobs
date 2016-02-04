class Spinach::Features::UsersSection < Spinach::FeatureSteps
  include CommonSteps::Visits
  include CommonSteps::Login
  include CommonSteps::Users

  step 'I create a "John Doe" user' do
    fill_in 'user[email]', with: 'john.doe@example.com'
    fill_in 'user[password]', with: 'johndoe'
    fill_in 'user[password_confirmation]', with: 'johndoe'
    click_button 'Create User'
  end

  step 'I should be on "John Doe" detail page' do
    current_path.must_equal user_path(id: User.find_by(email: 'john.doe@example.com').id)
  end

  step 'I should be on "John Doe" detail page with new email' do
    current_path.must_equal user_path(id: User.find_by(email: 'john.d@example.com').id)
  end

  step 'I should see a "John Doe" user in list' do
    page.has_content?('john.doe@example.com').must_equal true
  end

  step 'A "John Doe" user exists' do
    @john_doe = FactoryGirl.create :john_doe
  end

  step 'I click on "Delete" in the row with John Doe data' do
    page.find("#destroy_#{@john_doe.id}").click
  end

  step 'I click on "Edit" in the row with John Doe data' do
    page.find("#edit_#{@john_doe.id}").click
  end

  step 'I click on "Show" in the row with John Doe data' do
    page.find("#show_#{@john_doe.id}").click
  end

  step 'I should not see a "John Doe" user in list' do
    page.has_content?('john.doe@example.com').must_equal false
  end

  step 'I should see a "John Doe" user new email in list' do
    page.has_content?('john.d@example.com').must_equal true
  end

  step 'I change "Joe Doe" email to "john.d@example.com"' do
    fill_in 'user[email]', with: 'john.d@example.com'
    click_button 'Update User'
  end
end
