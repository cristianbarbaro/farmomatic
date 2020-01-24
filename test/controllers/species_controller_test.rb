require 'test_helper'

class SpeciesControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:expert_user)
    @species_one = species(:species_one)
  end

  test "should get index" do
    get species_index_url
    assert_response :success
  end

  test "should get new" do
    get new_species_url
    assert_response :success
  end

  test "should create species" do
    assert_difference('Species.count') do
      post species_index_url, params: { species: { name: @species_one.name } }
    end

    assert_redirected_to species_url(Species.last)
  end

  test "should show species" do
    get species_url(@species_one)
    assert_response :success
  end

  test "should get edit" do
    get edit_species_url(@species_one)
    assert_response :success
  end

  test "should update species" do
    patch species_url(@species_one), params: { species: { name: @species_one.name } }
    assert_redirected_to species_url(@species_one)
  end

  test "should not destroy species with association" do
    assert_raise(ActiveRecord::InvalidForeignKey) do
      delete species_url(@species_one)
    end

  end

  test "should destroy species without association" do
    @species_three = species(:species_three)
    assert_difference('Species.count', -1) do
      delete species_url(@species_three)
    end
    assert_redirected_to species_index_url
  end

  test "should not get index if user is not expert" do
    sign_in users(:owner_user)
    get species_index_url
    assert_redirected_to root_url
  end

  test "should not get new if user is not expert" do
    sign_in users(:owner_user)
    get new_species_url
    assert_redirected_to root_url
  end

  test "should not create species if user is not expert" do
    sign_in users(:owner_user)
    assert_difference('Species.count', 0) do
      post species_index_url, params: { species: { name: @species_one.name } }
    end

    assert_redirected_to root_url
  end

  test "should not show species if user is not expert" do
    sign_in users(:owner_user)
    get species_url(@species_one)
    assert_redirected_to root_url
  end

  test "should not get edit if user is not expert" do
    sign_in users(:owner_user)
    get edit_species_url(@species_one)
    assert_redirected_to root_url
  end

  test "should not update species if user is not expert" do
    sign_in users(:owner_user)
    patch species_url(@species_one), params: { species: { name: @species_one.name } }
    assert_redirected_to root_url
  end

  test "should not destroy species if user is not expert" do
    sign_in users(:owner_user)
    assert_difference('Species.count', 0) do
      post species_index_url, params: { species: { name: @species_one.name } }
    end

    assert_redirected_to root_url
  end

end
