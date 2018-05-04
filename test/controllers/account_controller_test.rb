require 'test_helper'

class AccountControllerTest < ActionDispatch::IntegrationTest
  test "should get mybooking" do
    get account_mybooking_url
    assert_response :success
  end

  test "should get myreservation" do
    get account_myreservation_url
    assert_response :success
  end

end
