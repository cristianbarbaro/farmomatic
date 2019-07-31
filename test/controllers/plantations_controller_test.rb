require 'test_helper'

class PlantationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @plantation = plantations(:one)
  end

  test "should get index" do
    get plantations_url
    assert_response :success
  end

  test "should get new" do
    get new_plantation_url
    assert_response :success
  end

  test "should create plantation" do
    assert_difference('Plantation.count') do
      post plantations_url, params: { plantation: { amount: @plantation.amount, comment: @plantation.comment, plot_id: @plantation.plot_id, species_id: @plantation.species_id } }
    end

    assert_redirected_to plantation_url(Plantation.last)
  end

  test "should show plantation" do
    get plantation_url(@plantation)
    assert_response :success
  end

  test "should get edit" do
    get edit_plantation_url(@plantation)
    assert_response :success
  end

  test "should update plantation" do
    patch plantation_url(@plantation), params: { plantation: { amount: @plantation.amount, comment: @plantation.comment, plot_id: @plantation.plot_id, species_id: @plantation.species_id } }
    assert_redirected_to plantation_url(@plantation)
  end

  test "should destroy plantation" do
    assert_difference('Plantation.count', -1) do
      delete plantation_url(@plantation)
    end

    assert_redirected_to plantations_url
  end
end
