require 'test_helper'

class UserSessionsControllerTest < ActionController::TestCase

  setup do
    @user = FactoryGirl.create(:user_na)
    @user_attributes = FactoryGirl.attributes_for(:user_na)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get create with registered user" do
    get :create, user: {email: @user_attributes[:email], password: @user_attributes[:password]}
    assert_redirected_to :users
  end

  test "should get create with unregistered user" do
    get :create, user: {email: 'not_registered@test.sk', password: 'password'}
    assert_redirected_to :login
  end

  test "should get destroy without logged in" do
    get :destroy
    assert_redirected_to :login
  end

  test "should get destroy with logged in" do
    login_user(@user)
    get :destroy
    assert_redirected_to :static_pages_home
  end

end
