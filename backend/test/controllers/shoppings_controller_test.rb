require 'test_helper'

class ShoppingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shopping = shoppings(:one)
  end

  test "should get index" do
    get shoppings_url, as: :json
    assert_response :success
  end

  test "should create shopping" do
    assert_difference('Shopping.count') do
      post shoppings_url, params: { shopping: { purchased_at: @shopping.purchased_at } }, as: :json
    end

    assert_response 201
  end

  test "should show shopping" do
    get shopping_url(@shopping), as: :json
    assert_response :success
  end

  test "should update shopping" do
    patch shopping_url(@shopping), params: { shopping: { purchased_at: @shopping.purchased_at } }, as: :json
    assert_response 200
  end

  test "should destroy shopping" do
    assert_difference('Shopping.count', -1) do
      delete shopping_url(@shopping), as: :json
    end

    assert_response 204
  end
end
