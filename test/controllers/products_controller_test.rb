require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:expert_user)
    @product_one = products(:product_one)
  end

  test "should get index" do
    get products_url
    assert_response :success
  end

  test "should get new" do
    get new_product_url
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post products_url, params: { product: { composition: @product_one.composition, description: @product_one.description, name: @product_one.name } }
    end

    assert_redirected_to product_url(Product.last)
  end

  test "should show product" do
    get product_url(@product_one)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_url(@product_one)
    assert_response :success
  end

  test "should update product" do
    patch product_url(@product_one), params: { product: { composition: @product_one.composition, description: @product_one.description, name: @product_one.name } }
    assert_redirected_to product_url(@product_one)
  end

  test "should not destroy product with association" do
    assert_difference('Product.count',0) do
      delete product_url(@product_one)
    end
  end

  test "should destroy product with association" do
    @product_three = products(:product_three)
    assert_difference('Product.count', -1) do
      delete product_url(@product_three)
    end

    assert_redirected_to products_url
  end

  test "should not get index if user is not expert" do
    sign_in users(:owner_user)
    get products_url
    assert_redirected_to root_url
  end

  test "should not get new if user is not expert" do
    sign_in users(:owner_user)
    get new_product_url
    assert_redirected_to root_url
  end

  test "should not create product if user is not expert" do
    sign_in users(:owner_user)
    assert_difference('Product.count', 0) do
      post products_url, params: { product: { composition: @product_one.composition, description: @product_one.description, name: @product_one.name } }
    end

    assert_redirected_to root_url
  end

  test "should not show product if user is not expert" do
    sign_in users(:owner_user)
    get product_url(@product_one)
    assert_redirected_to root_url
  end

  test "should not get edit if user is not expert" do
    sign_in users(:owner_user)
    get edit_product_url(@product_one)
    assert_redirected_to root_url
  end

  test "should not update product if user is not expert" do
    sign_in users(:owner_user)
    patch product_url(@product_one), params: { product: { composition: @product_one.composition, description: @product_one.description, name: @product_one.name } }
    assert_redirected_to root_url
  end

  test "should not destroy product if user is not expert" do
    sign_in users(:owner_user)
    @product_three = products(:product_three)
    assert_difference('Product.count', 0) do
      delete product_url(@product_three)
    end

    assert_redirected_to root_url
  end

end
