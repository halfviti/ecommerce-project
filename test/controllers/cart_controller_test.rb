require 'test_helper'

class CartControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cart_index_url
    assert_response :success
  end

  test "should get add_product" do
    get cart_add_product_url
    assert_response :success
  end

end
