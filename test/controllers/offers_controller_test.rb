require 'test_helper'

class OffersControllerTest < ActionController::TestCase
  setup do
    @user_na = FactoryGirl.create :user_na
    @offer_extern = offers(:offer_profesia)
  end

  test "should get index as logged in" do
    login_user(@user_na)
    get :index
    assert_response :success
    assert_not_nil assigns(:offers)
  end

  test "should get index as not logged in" do
    get :index
    assert_redirected_to :login
  end

  test "should get new as logged in" do
    login_user(@user_na)
    get :new
    assert_response :success
  end

  test "should get new as not logged in" do
    get :new
    assert_redirected_to :login
  end

  test "should create offer as logged in" do
    login_user(@user_na)
    assert_difference('Offer.count') do
      post :create, offer: { company: @offer_extern.company, content: @offer_extern.content, ico: @offer_extern.ico, last_update: @offer_extern.last_update, location: @offer_extern.location, external_offer_id: @offer_extern.external_offer_id, offerdate: @offer_extern.offerdate, position: @offer_extern.position, url: @offer_extern.url }
    end

    assert_redirected_to offer_path(assigns(:offer))
  end

  test "should create offer as not logged in" do
    get :create
    assert_redirected_to :login
  end

  test "should show offer as logged in" do
    login_user(@user_na)
    get :show, id: @offer_extern
    assert_response :success
  end

  test "should show offer as not logged in" do
    get :show, id: @offer_extern
    assert_response :success
  end

  test "should get edit as logged in" do
    login_user(@user_na)
    get :edit, id: @offer_extern
    assert_response :success
  end

  test "should get edit as not logged in" do
    get :edit, id: @offer_extern
    assert_redirected_to :login
  end

  test "should update offer as logged in" do
    login_user(@user_na)
    patch :update, id: @offer_extern, offer: { company: @offer_extern.company, content: @offer_extern.content, ico: @offer_extern.ico, last_update: @offer_extern.last_update, location: @offer_extern.location, external_offer_id: @offer_extern.external_offer_id, offerdate: @offer_extern.offerdate, position: @offer_extern.position, url: @offer_extern.url }
    assert_redirected_to offer_path(assigns(:offer))
  end

  test "should update offer as not logged in" do
    get :update, id: @offer_extern
    assert_redirected_to :login
  end

  test "should destroy offer as logged in" do
    login_user(@user_na)
    assert_difference('Offer.count', -1) do
      delete :destroy, id: @offer_extern
    end

    assert_redirected_to offers_path
  end

  test "should destroy offer as not logged in" do
    get :destroy, id: @offer_extern
    assert_redirected_to :login
  end

end
