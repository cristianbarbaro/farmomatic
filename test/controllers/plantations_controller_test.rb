require 'test_helper'

class PlantationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @plantation_one = plantations(:plantation_one)
  end

  test "should get index" do
    get farm_plot_plantations_url(farm_id: 1, plot_id: 1)
    assert_response :success
  end

  test "should get new" do
    get new_farm_plot_plantation_url(farm_id: 1, plot_id: 1)
    assert_response :success
  end

  test "should create plantation" do
    assert_difference('Plantation.count') do
      post farm_plot_plantations_url(farm_id: 1, plot_id: 1), params: { plantation: { amount: @plantation_one.amount, comment: @plantation_one.comment, plot_id: @plantation_one.plot_id, species_id: @plantation_one.species_id } }
    end

    assert_redirected_to farm_plot_plantations_url(farm_id: 1, plot_id: 1)
  end

  test "should show plantation" do
    get farm_plot_plantation_url(1,1,@plantation_one)
    assert_response :success
  end

  test "should get edit" do
    get edit_farm_plot_plantation_url(1,1,@plantation_one)
    assert_response :success
  end

  test "should update plantation" do
    patch farm_plot_plantation_url(1,1,@plantation_one), params: { plantation: { amount: @plantation_one.amount, comment: @plantation_one.comment, plot_id: @plantation_one.plot_id, species_id: @plantation_one.species_id } }
    assert_redirected_to farm_plot_plantation_url(1,1,@plantation_one)
  end

  test "should destroy plantation" do
    assert_difference('Plantation.count', -1) do
      delete farm_plot_plantation_url(1,1,@plantation_one)
    end

    assert_redirected_to farm_plot_plantations_url(farm_id: 1, plot_id: 1)
  end

  test "should not create plantation if user is not owner of farm" do
    sign_in users(:viewer_user)
    assert_difference('Plantation.count',0) do
      post farm_plot_plantations_url(farm_id: 1, plot_id: 1), params: { plantation: { amount: @plantation_one.amount, comment: @plantation_one.comment, plot_id: @plantation_one.plot_id, species_id: @plantation_one.species_id } }
    end
  end

  test "should not get edit if user is viewer" do
    sign_in users(:viewer_user)
    get edit_farm_plot_plantation_url(1,1,@plantation_one)
    assert_response :redirect
  end

  test "should not update problem if user is viewer" do
    sign_in users(:viewer_user)
    patch farm_plot_plantation_url(1,1,@plantation_one), params: { plantation: { amount: @plantation_one.amount, comment: @plantation_one.comment, plot_id: @plantation_one.plot_id, species_id: @plantation_one.species_id } }
    assert_response :redirect # root_url
  end

  test "should not destroy if user is viewer" do
    sign_in users(:viewer_user)
    assert_difference('Plantation.count', 0) do
      delete farm_plot_plantation_url(1,1,@plantation_one)
    end
    assert_response :redirect # root_url
  end

end
