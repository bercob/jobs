require 'test_helper'

class UserSessionsControllerTest < ActionController::TestCase

  setup do
    @user = users(:user_na)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get create" do
    get :create, user_sessions: {email: @user.email}
    assert_response :success
  end

  test "should get destroy without logged in" do
    get :destroy
    assert_redirected_to :login
  end

  test "should get destroy with logged in" do
    session[:user_id] = @user.id
    get :destroy
    assert_redirected_to :static_pages_home
  end

end
