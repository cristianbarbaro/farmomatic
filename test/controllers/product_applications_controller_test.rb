require 'test_helper'

class ProductApplicationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product_application_one = product_applications(:product_application_one)
  end

  test "should get index" do
    get farm_plot_product_applications_url(farm_id: 1, plot_id: 1)
    assert_response :success
  end

  test "should get new" do
    get new_farm_plot_product_application_url(farm_id: 1, plot_id: 1)
    assert_response :success
  end

  test "should create product_application" do
    assert_difference('ProductApplication.count') do
      post farm_plot_product_applications_url(farm_id: 1, plot_id: 1), params: { product_application: { amount: @product_application_one.amount, comment: @product_application_one.comment, plot_id: @product_application_one.plot_id, product_id: @product_application_one.product_id } }
    end

    assert_redirected_to farm_plot_product_applications_url(farm_id: 1, plot_id: 1)
  end

  test "should show product_application" do
    get farm_plot_product_application_url(1, 1, @product_application_one)
    assert_response :success
  end

  test "should get edit" do
    get edit_farm_plot_product_application_url(1, 1, @product_application_one)
    assert_response :success
  end

  test "should update product_application" do
    patch farm_plot_product_application_url(1, 1, @product_application_one), params: { product_application: { amount: @product_application_one.amount, comment: @product_application_one.comment, plot_id: @product_application_one.plot_id, product_id: @product_application_one.product_id } }
    assert_redirected_to farm_plot_product_application_url(1, 1, @product_application_one)
  end

  test "should destroy product_application" do
    assert_difference('ProductApplication.count', -1) do
      delete farm_plot_product_application_url(1,1,@product_application_one)
    end

    assert_redirected_to farm_plot_product_applications_url(farm_id: 1, plot_id: 1)
  end

  test "should not create product_application if user is viewer of farm" do
    sign_in users(:viewer_user)
    assert_difference('ProductApplication.count', 0) do
      post farm_plot_product_applications_url(farm_id: 1, plot_id: 1), params: { product_application: { amount: @product_application_one.amount, comment: @product_application_one.comment, plot_id: @product_application_one.plot_id, product_id: @product_application_one.product_id } }
    end
    assert_response :redirect
  end

  test "should not get edit if user is viewer" do
    sign_in users(:viewer_user)
    get edit_farm_plot_product_application_url(1, 1, @product_application_one)
    assert_response :redirect
    assert_redirected_to root_url
  end

  test "should not update problem if user is viewer" do
    sign_in users(:viewer_user)
    patch farm_plot_product_application_url(1, 1, @product_application_one), params: { product_application: { amount: @product_application_one.amount, comment: @product_application_one.comment, plot_id: @product_application_one.plot_id, product_id: @product_application_one.product_id } }
    assert_response :redirect
  end

  test "should not destroy if user is viewer" do
    sign_in users(:viewer_user)
    assert_difference('ProductApplication.count', 0) do
      delete farm_plot_product_application_url(1,1,@product_application_one)
    end
  end

end
