require 'test_helper'

class FarmsControllerTest < ActionDispatch::IntegrationTest
  # owner_user is owner 
  setup do
    @farm_owner_user = farms(:farm_owner_user)
  end

  test "should get index" do
    get farms_url
    assert_response :success
  end

  test "should get new" do
    get new_farm_url
    assert_response :success
  end

  test "should create farm" do
    assert_difference('Farm.count') do
      post farms_url, params: { farm: { description: @farm_owner_user.description, name: @farm_owner_user.name, description: @farm_owner_user.description, address: @farm_owner_user.address } }
    end

    assert_redirected_to farm_url(Farm.last)
  end

  test "should show farm" do
    get farm_url(@farm_owner_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_farm_url(@farm_owner_user)
    assert_response :success
  end

  test "should update farm" do
    patch farm_url(@farm_owner_user), params: { farm: { description: @farm_owner_user.description, name: @farm_owner_user.name, description: @farm_owner_user.description, address: @farm_owner_user.address } }
    assert_redirected_to farm_url(@farm_owner_user)
  end

  test "should remove farm for user if want destroy it" do
    assert_difference('Farm.count', 0) do
      delete farm_url(@farm_owner_user)
    end

    assert_redirected_to farms_url

    get farm_url(@farm_owner_user)
    assert_response 403
  end

  # Viewer tests

  test "should show farm if user is viewer" do
    sign_in users(:viewer_user)
    get farm_url(@farm_owner_user)
    assert_response :success
  end

  test "should not get edit if user is viewer" do
    sign_in users(:viewer_user)
    get edit_farm_url(@farm_owner_user)

    assert_redirected_to root_url
  end

  test "should not update edit if user is viewer" do
    sign_in users(:viewer_user)
    patch farm_url(@farm_owner_user), params: { farm: { description: @farm_owner_user.description, name: @farm_owner_user.name, description: @farm_owner_user.description, address: @farm_owner_user.address } }
    assert_redirected_to root_url
  end

  test "should not destroy farm if user is viewer" do
    sign_in users(:viewer_user)
    assert_difference('Farm.count', 0) do
      delete farm_url(@farm_owner_user)
    end

    assert_redirected_to root_url

    get farm_url(@farm_owner_user)
    assert_response 403
  end
end
