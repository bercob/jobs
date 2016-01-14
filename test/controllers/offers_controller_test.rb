require 'test_helper'

class OffersControllerTest < ActionController::TestCase
  setup do
    @offer = offers(:offer_local)
    session[:user_id] = users(:user_na).id
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:offers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create offer" do
    assert_difference('Offer.count') do
      post :create, offer: { company: @offer.company, content: @offer.content, ico: @offer.ico, last_update: @offer.last_update, location: @offer.location, external_offer_id: @offer.external_offer_id, offerdate: @offer.offerdate, position: @offer.position, url: @offer.url }
    end

    assert_redirected_to offer_path(assigns(:offer))
  end

  test "should show offer" do
    get :show, id: @offer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @offer
    assert_response :success
  end

  test "should update offer" do
    patch :update, id: @offer, offer: { company: @offer.company, content: @offer.content, ico: @offer.ico, last_update: @offer.last_update, location: @offer.location, external_offer_id: @offer.external_offer_id, offerdate: @offer.offerdate, position: @offer.position, url: @offer.url }
    assert_redirected_to offer_path(assigns(:offer))
  end

  test "should destroy offer" do
    assert_difference('Offer.count', -1) do
      delete :destroy, id: @offer
    end

    assert_redirected_to offers_path
  end
end
