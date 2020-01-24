require 'test_helper'

class TypeProblemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:expert_user)
    @type_problem_one = type_problems(:type_problem_one)
  end

  test "should get index" do
    get type_problems_url
    assert_response :success
  end

  test "should get new" do
    get new_type_problem_url
    assert_response :success
  end

  test "should create type_problem" do
    assert_difference('TypeProblem.count') do
      post type_problems_url, params: { type_problem: { description: @type_problem_one.description, name: @type_problem_one.name, scientific_name: @type_problem_one.scientific_name, url: @type_problem_one.url } }
    end

    assert_redirected_to type_problem_url(TypeProblem.last)
  end

  test "should show type_problem" do
    get type_problem_url(@type_problem_one)
    assert_response :success
  end

  test "should get edit" do
    get edit_type_problem_url(@type_problem_one)
    assert_response :success
  end

  test "should update type_problem" do
    patch type_problem_url(@type_problem_one), params: { type_problem: { description: @type_problem_one.description, name: @type_problem_one.name, scientific_name: @type_problem_one.scientific_name, url: @type_problem_one.url } }
    assert_redirected_to type_problem_url(@type_problem_one)
  end

  test "should not destroy type_problem with association" do
    assert_difference("TypeProblem.count", 0) do
      delete type_problem_url(@type_problem_one)
    end

  end

  test "should destroy type_problem without association" do
    @type_problem_three = type_problems(:type_problem_three)
    assert_difference('TypeProblem.count', -1) do
      delete type_problem_url(@type_problem_three)
    end

    assert_redirected_to type_problems_url
  end

  test "should not get index if user is not expert" do
    sign_in users(:owner_user)
    get type_problems_url
    assert_redirected_to root_url
  end

  test "should not get new if user is not expert" do
    sign_in users(:owner_user)
    get new_type_problem_url
    assert_redirected_to root_url
  end

  test "should not create type_problems if user is not expert" do
    sign_in users(:owner_user)
    assert_difference('TypeProblem.count', 0) do
      post type_problems_url, params: { type_problem: { description: @type_problem_one.description, name: @type_problem_one.name, scientific_name: @type_problem_one.scientific_name, url: @type_problem_one.url } }
    end

    assert_redirected_to root_url
  end

  test "should not show type_problem if user is not expert" do
    sign_in users(:owner_user)
    get type_problem_url(@type_problem_one)
    assert_redirected_to root_url
  end

  test "should not get edit if user is not expert" do
    sign_in users(:owner_user)
    get edit_type_problem_url(@type_problem_one)
    assert_redirected_to root_url
  end

  test "should not update type_problem if user is not expert" do
    sign_in users(:owner_user)
    patch type_problem_url(@type_problem_one), params: { type_problem: { description: @type_problem_one.description, name: @type_problem_one.name, scientific_name: @type_problem_one.scientific_name, url: @type_problem_one.url } }
    assert_redirected_to root_url
  end

  test "should not destroy type_problem if user is not expert" do
    sign_in users(:owner_user)
    @type_problem_three = type_problems(:type_problem_three)
    assert_difference('TypeProblem.count', 0) do
      delete type_problem_url(@type_problem_three)
    end

    assert_redirected_to root_url
  end


end
