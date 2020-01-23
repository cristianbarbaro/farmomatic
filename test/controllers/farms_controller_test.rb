require 'test_helper'

class FarmsControllerTest < ActionDispatch::IntegrationTest
  # owner_user is owner 
  setup do
    sign_in users(:owner_user)
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

  test "should destroy farm" do
    assert_difference('Farm.count', -1) do
      delete farm_url(@farm_owner_user)
    end

    assert_redirected_to farms_url
  end

  # Viewer tests

  test "should not get edit" do
    sign_in users(:viewer_user)
    get edit_farm_url(@farm_owner_user)

    assert_redirected_to root_url
  end

  test "should not update edit" do
    sign_in users(:viewer_user)
    patch farm_url(@farm_owner_user), params: { farm: { description: @farm_owner_user.description, name: @farm_owner_user.name, description: @farm_owner_user.description, address: @farm_owner_user.address } }
    assert_redirected_to root_url
  end

  test "should not destroy farm" do
    sign_in users(:viewer_user)
    assert_difference('Farm.count', 0) do
      delete farm_url(@farm_owner_user)
    end

    assert_redirected_to root_url
  end
end
