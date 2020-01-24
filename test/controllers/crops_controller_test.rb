require 'test_helper'

class CropsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @crop_one = crops(:crop_one)
  end

  test "should get index" do
    get farm_plot_crops_url(farm_id: 1, plot_id: 1)
    assert_response :success
  end

  test "should get new" do
    get new_farm_plot_crop_url(farm_id: 1, plot_id: 1)
    assert_response :success
  end

  test "should create crop" do
    assert_difference('Crop.count') do
      post farm_plot_crops_url(farm_id: 1, plot_id: 1), params: { crop: { amount: @crop_one.amount, comment: @crop_one.comment, plot_id: @crop_one.plot_id, variety_id: @crop_one.variety_id } }
    end
    assert_redirected_to farm_plot_crops_url(farm_id: 1, plot_id: 1)
    #assert_redirected_to crop_url(Crop.last)
  end

  test "should show crop" do
    get farm_plot_crop_url(1, 1, @crop_one)
    assert_response :success
  end

  test "should get edit" do
    get edit_farm_plot_crop_url(1, 1, @crop_one)
    assert_response :success
  end

  test "should update crop" do
    patch farm_plot_crop_url(1, 1, @crop_one), params: { crop: { amount: @crop_one.amount, comment: @crop_one.comment, plot_id: @crop_one.plot_id, variety_id: @crop_one.variety_id } }
    assert_redirected_to farm_plot_crop_url(1, 1, @crop_one)
  end

  test "should destroy crop" do
    assert_difference('Crop.count', -1) do
      delete farm_plot_crop_url(1, 1, @crop_one)
    end

    assert_redirected_to farm_plot_crops_url(farm_id:1 , plot_id:1)
  end

  test "should not create crop if user is viewer" do
    sign_in users(:viewer_user)
    assert_difference('Crop.count', 0) do
      post farm_plot_crops_url(farm_id: 1, plot_id: 1), params: { crop: { amount: @crop_one.amount, comment: @crop_one.comment, plot_id: @crop_one.plot_id, variety_id: @crop_one.variety_id } }
    end
    assert_redirected_to root_url
  end

  test "should not get edit if user is viewer" do
    sign_in users(:viewer_user)
    get edit_farm_plot_crop_url(1, 1, @crop_one)
    assert_redirected_to root_url
  end

  test "should not update crop if user is viewer" do
    sign_in users(:viewer_user)
    patch farm_plot_crop_url(1, 1, @crop_one), params: { crop: { amount: @crop_one.amount, comment: @crop_one.comment, plot_id: @crop_one.plot_id, variety_id: @crop_one.variety_id } }
    assert_redirected_to root_url
  end

  test "should not destroy crop if user is viewer" do
    sign_in users(:viewer_user)
    assert_difference('Crop.count', 0) do
      delete farm_plot_crop_url(1, 1, @crop_one)
    end
    assert_redirected_to root_url
  end

end
