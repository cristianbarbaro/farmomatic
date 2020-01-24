require 'test_helper'

class ProblemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @problem_one = problems(:problem_one)
  end

  test "should get index" do
    get farm_plot_problems_url(farm_id: 1, plot_id: 1)
    assert_response :success
  end

  test "should get new" do
    get new_farm_plot_problem_url(farm_id:1, plot_id:1)
    assert_response :success
  end

  test "should create problem" do
    assert_difference('Problem.count') do
      post farm_plot_problems_url(farm_id:1, plot_id:1), params: { problem: { comment: @problem_one.comment, plot_id: @problem_one.plot_id, type_problem_id: @problem_one.type_problem_id } }
    end

    assert_redirected_to farm_plot_problems_url(farm_id: 1, plot_id: 1)
  end

  test "should show problem" do
    get farm_plot_problem_url(1, 1, @problem_one)
    assert_response :success
  end

  test "should get edit" do
    get edit_farm_plot_problem_url(1, 1, @problem_one)
    assert_response :success
  end

  test "should update problem" do
    patch farm_plot_problem_url(1, 1, @problem_one), params: { problem: { comment: @problem_one.comment, plot_id: @problem_one.plot_id, type_problem_id: @problem_one.type_problem_id } }
    assert_redirected_to farm_plot_problem_url(1, 1, @problem_one)
  end

  test "should destroy problem" do
    assert_difference('Problem.count', -1) do
      delete farm_plot_problem_url(1, 1, @problem_one)
    end

    assert_redirected_to farm_plot_problems_url(farm_id:1, plot_id:1)
  end

  test "should not create plantation if user is not owner of farm" do
    sign_in users(:viewer_user)
    assert_difference('Problem.count', 0) do
      post farm_plot_problems_url(farm_id:1, plot_id:1), params: { problem: { comment: @problem_one.comment, plot_id: @problem_one.plot_id, type_problem_id: @problem_one.type_problem_id } }
    end
    assert_response :redirect
  end

  test "should not get edit if user is viewer" do
    sign_in users(:viewer_user)
    get edit_farm_plot_problem_url(1, 1, @problem_one)
    assert_response :redirect
  end

  test "should not update problem if user is viewer" do
    sign_in users(:viewer_user)
    patch farm_plot_problem_url(1, 1, @problem_one), params: { problem: { comment: @problem_one.comment, plot_id: @problem_one.plot_id, type_problem_id: @problem_one.type_problem_id } }
    assert_response :redirect
  end

  test "should not destroy if user is viewer" do
    sign_in users(:viewer_user)
    assert_difference('Problem.count', 0) do
      delete farm_plot_problem_url(1, 1, @problem_one)
    end
  end

end
