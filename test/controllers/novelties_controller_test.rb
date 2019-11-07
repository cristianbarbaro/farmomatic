require 'test_helper'

class NoveltiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @novelty = novelties(:one)
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
      post novelties_url, params: { novelty: { body: @novelty.body, title: @novelty.title, user_id: @novelty.user_id } }
    end

    assert_redirected_to novelty_url(Novelty.last)
  end

  test "should show novelty" do
    get novelty_url(@novelty)
    assert_response :success
  end

  test "should get edit" do
    get edit_novelty_url(@novelty)
    assert_response :success
  end

  test "should update novelty" do
    patch novelty_url(@novelty), params: { novelty: { body: @novelty.body, title: @novelty.title, user_id: @novelty.user_id } }
    assert_redirected_to novelty_url(@novelty)
  end

  test "should destroy novelty" do
    assert_difference('Novelty.count', -1) do
      delete novelty_url(@novelty)
    end

    assert_redirected_to novelties_url
  end
end
