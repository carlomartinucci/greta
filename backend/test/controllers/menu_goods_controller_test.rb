require 'test_helper'

class MenuGoodsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @menu_good = menu_goods(:one)
  end

  test "should get index" do
    get menu_goods_url, as: :json
    assert_response :success
  end

  test "should create menu_good" do
    assert_difference('MenuGood.count') do
      post menu_goods_url, params: { menu_good: { good_id: @menu_good.good_id, meal: @menu_good.meal, menu_id: @menu_good.menu_id, quantity: @menu_good.quantity } }, as: :json
    end

    assert_response 201
  end

  test "should show menu_good" do
    get menu_good_url(@menu_good), as: :json
    assert_response :success
  end

  test "should update menu_good" do
    patch menu_good_url(@menu_good), params: { menu_good: { good_id: @menu_good.good_id, meal: @menu_good.meal, menu_id: @menu_good.menu_id, quantity: @menu_good.quantity } }, as: :json
    assert_response 200
  end

  test "should destroy menu_good" do
    assert_difference('MenuGood.count', -1) do
      delete menu_good_url(@menu_good), as: :json
    end

    assert_response 204
  end
end
