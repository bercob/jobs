require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  setup do
    @user_admin = FactoryGirl.create :user_admin
    @user_na = FactoryGirl.create :user_na
    @user_new = User.new(email: 'new@test.sk', password: 'password', password_confirmation: 'password', admin: false)
  end

  test "should get index as admin" do
    login_user(@user_admin)
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get index as not admin" do
    login_user(@user_na)
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get index as not logged in" do
    get :index
    assert_redirected_to :login
  end

  test "should get new as admin" do
    login_user(@user_admin)
    get :new
    assert_response :success
  end

  test "should get new as not admin" do
    login_user(@user_na)
    get :new
    assert_redirected_to :users
  end

  test "should get new as not logged in" do
    get :new
    assert_redirected_to :login
  end

  test "should create user as admin" do
    login_user(@user_admin)
    assert_difference('User.count') do
      post :create, user: { email: @user_new.email, password: @user_new.password, password_confirmation: @user_new.password_confirmation }
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should create user as not admin" do
    login_user(@user_na)
    get :create
    assert_redirected_to :users
  end

  test "should get create as not logged in" do
    get :create
    assert_redirected_to :login
  end

  test "should show user as admin" do
    login_user(@user_admin)
    get :show, id: @user_na
    assert_response :success
  end

  test "should show user as not admin" do
    login_user(@user_na)
    get :show, id: @user_na
    assert_response :success
  end

  test "should get show as not logged in" do
    get :show, id: @user_na
    assert_redirected_to :login
  end

  test "should get edit user as admin" do
    login_user(@user_admin)
    get :edit, id: @user_na
    assert_response :success
  end

  test "should get edit user as not admin" do
    login_user(@user_na)
    get :edit, id: @user_admin
    assert_redirected_to :users
  end

  test "should get edit profile as not admin" do
    login_user(@user_na)
    get :edit, id: @user_na
    assert_response :success
  end

  test "should get edit as not logged in" do
    get :edit, id: @user_na
    assert_redirected_to :login
  end

  test "should update user as admin" do
    login_user(@user_admin)
    patch :update, id: @user_na, user: { email: @user_na.email, admin: @user_na.admin }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should update user as not admin" do
    login_user(@user_na)
    patch :update, id: @user_admin, user: { email: @user_admin.email, admin: @user_admin.admin }
    assert_redirected_to :users
  end

  test "should update profile as not admin" do
    login_user(@user_na)
    patch :update, id: @user_na, user: { email: @user_na.email, admin: @user_na.admin }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should update profile to admin=true as not admin" do
    login_user(@user_na)
    patch :update, id: @user_na, user: { email: @user_na.email, admin: true }
    user = User.find_by(id: @user_na)
    assert(!user.admin, 'not admin user changed his role to admin')
    assert_redirected_to user_path(assigns(:user))
  end

  test "should get update as not logged in" do
    get :update, id: @user_na
    assert_redirected_to :login
  end

  test "should destroy user as admin" do
    login_user(@user_admin)
    assert_difference('User.count', -1) do
      delete :destroy, id: @user_na
    end

    assert_redirected_to users_path
  end

  test "should destroy user as not admin" do
    login_user(@user_na)
    assert_no_difference('User.count', -1) do
      delete :destroy, id: @user_admin
    end

    assert_redirected_to users_path
  end

  test "should destroy as not logged in" do
    get :destroy, id: @user_na
    assert_redirected_to :login
  end

end
