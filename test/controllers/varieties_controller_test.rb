require 'test_helper'

class VarietiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:expert_user)
    @variety_one = varieties(:variety_one)
  end

  test "should get index" do
    get varieties_url
    assert_response :success
  end

  test "should get new" do
    get new_variety_url
    assert_response :success
  end

  test "should create variety" do
    assert_difference('Variety.count') do
      post varieties_url, params: { variety: { description: @variety_one.description, name: @variety_one.name, scientific_name: @variety_one.scientific_name, url: @variety_one.url } }
    end

    assert_redirected_to variety_url(Variety.last)
  end

  test "should show variety" do
    get variety_url(@variety_one)
    assert_response :success
  end

  test "should get edit" do
    get edit_variety_url(@variety_one)
    assert_response :success
  end

  test "should update variety" do
    patch variety_url(@variety_one), params: { variety: { description: @variety_one.description, name: @variety_one.name, scientific_name: @variety_one.scientific_name, url: @variety_one.url } }
    assert_redirected_to variety_url(@variety_one)
  end

  test "should not destroy variety with association" do
    assert_difference("Variety.count", 0) do
      delete variety_url(@variety_one)
    end
  end

  test "should destroy variety" do
    @variety_three = varieties(:variety_three)
    assert_difference('Variety.count', -1) do
      delete variety_url(@variety_three)
    end

    assert_redirected_to varieties_url
  end

  test "should not get index if user is not expert" do
    sign_in users(:owner_user)
    get varieties_url
    assert_redirected_to root_url
  end

  test "should not get new if user is not expert" do
    sign_in users(:owner_user)
    get new_variety_url
    assert_redirected_to root_url
  end

  test "should not create variety if user is not expert" do
    sign_in users(:owner_user)
    assert_difference('Variety.count', 0) do
      post varieties_url, params: { variety: { description: @variety_one.description, name: @variety_one.name, scientific_name: @variety_one.scientific_name, url: @variety_one.url } }
    end

    assert_redirected_to root_url
  end

  test "should not show variety if user is not expert" do
    sign_in users(:owner_user)
    get variety_url(@variety_one)
    assert_redirected_to root_url
  end

  test "should not get edit if user is not expert" do
    sign_in users(:owner_user)
    get edit_variety_url(@variety_one)
    assert_redirected_to root_url
  end

  test "should not update variety if user is not expert" do
    sign_in users(:owner_user)
    patch variety_url(@variety_one), params: { variety: { description: @variety_one.description, name: @variety_one.name, scientific_name: @variety_one.scientific_name, url: @variety_one.url } }
    assert_redirected_to root_url
  end

  test "should not destroy variety if user is not expert" do
    sign_in users(:owner_user)
    @variety_three = varieties(:variety_three)
    assert_difference('Variety.count', 0) do
      delete variety_url(@variety_three)
    end
    assert_redirected_to root_url
  end

end
