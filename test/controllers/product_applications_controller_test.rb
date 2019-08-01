require 'test_helper'

class ProductApplicationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product_application = product_applications(:one)
  end

  test "should get index" do
    get product_applications_url
    assert_response :success
  end

  test "should get new" do
    get new_product_application_url
    assert_response :success
  end

  test "should create product_application" do
    assert_difference('ProductApplication.count') do
      post product_applications_url, params: { product_application: { amount: @product_application.amount, comment: @product_application.comment, plot_id: @product_application.plot_id, product_id: @product_application.product_id } }
    end

    assert_redirected_to product_application_url(ProductApplication.last)
  end

  test "should show product_application" do
    get product_application_url(@product_application)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_application_url(@product_application)
    assert_response :success
  end

  test "should update product_application" do
    patch product_application_url(@product_application), params: { product_application: { amount: @product_application.amount, comment: @product_application.comment, plot_id: @product_application.plot_id, product_id: @product_application.product_id } }
    assert_redirected_to product_application_url(@product_application)
  end

  test "should destroy product_application" do
    assert_difference('ProductApplication.count', -1) do
      delete product_application_url(@product_application)
    end

    assert_redirected_to product_applications_url
  end
end
