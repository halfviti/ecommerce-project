require 'test_helper'

class CheckoutControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get checkout_index_url
    assert_response :success
  end

  test "should get confirmation" do
    get checkout_confirmation_url
    assert_response :success
  end

end
