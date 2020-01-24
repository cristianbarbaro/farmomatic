require 'test_helper'

class NoveltiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:expert_user)
    @novelty_one = novelties(:novelty_one)
  end

  test "should get index" do
    get novelties_url
    assert_response :success
  end

  test "should get new" do
    get new_novelty_url
    assert_response :success
  end

  test "should create novelty" do
    assert_difference('Novelty.count') do
      post novelties_url, params: { novelty: { body: @novelty_one.body, title: @novelty_one.title, user_id: @novelty_one.user_id } }
    end

    assert_redirected_to novelty_url(Novelty.last)
  end

  test "should show novelty" do
    get novelty_url(@novelty_one)
    assert_response :success
  end

  test "should get edit" do
    get edit_novelty_url(@novelty_one)
    assert_response :success
  end

  test "should update novelty" do
    patch novelty_url(@novelty_one), params: { novelty: { body: @novelty_one.body, title: @novelty_one.title, user_id: @novelty_one.user_id } }
    assert_redirected_to novelty_url(@novelty_one)
  end

  test "should destroy novelty" do
    assert_difference('Novelty.count', -1) do
      delete novelty_url(@novelty_one)
    end

    assert_redirected_to novelties_url
  end

  test "should not get index if user is not expert" do
    sign_in users(:owner_user)
    get novelties_url
    assert_redirected_to root_url
  end
  
end
