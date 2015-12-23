require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get contact" do
    get :contact
    assert_response :success
  end

  test "should get about" do
    get :about
    assert_response :success
  end

  test "should get customer_services" do
    get :customer_services
    assert_response :success
  end

  test "should get services_for_applicants" do
    get :services_for_applicants
    assert_response :success
  end

  test "should get reference" do
    get :reference
    assert_response :success
  end

end
