require 'test_helper'

class ProductSetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product_set = product_sets(:one)
  end

  test "should get index" do
    get product_sets_url
    assert_response :success
  end

  test "should get new" do
    get new_product_set_url
    assert_response :success
  end

  test "should create product_set" do
    assert_difference('ProductSet.count') do
      post product_sets_url, params: { product_set: { product_id: @product_set.product_id, region_id: @product_set.region_id } }
    end

    assert_redirected_to product_set_url(ProductSet.last)
  end

  test "should show product_set" do
    get product_set_url(@product_set)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_set_url(@product_set)
    assert_response :success
  end

  test "should update product_set" do
    patch product_set_url(@product_set), params: { product_set: { product_id: @product_set.product_id, region_id: @product_set.region_id } }
    assert_redirected_to product_set_url(@product_set)
  end

  test "should destroy product_set" do
    assert_difference('ProductSet.count', -1) do
      delete product_set_url(@product_set)
    end

    assert_redirected_to product_sets_url
  end
end
