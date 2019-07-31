require 'test_helper'

class TypeProblemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @type_problem = type_problems(:one)
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
      post type_problems_url, params: { type_problem: { description: @type_problem.description, name: @type_problem.name, scientificName: @type_problem.scientificName, url: @type_problem.url } }
    end

    assert_redirected_to type_problem_url(TypeProblem.last)
  end

  test "should show type_problem" do
    get type_problem_url(@type_problem)
    assert_response :success
  end

  test "should get edit" do
    get edit_type_problem_url(@type_problem)
    assert_response :success
  end

  test "should update type_problem" do
    patch type_problem_url(@type_problem), params: { type_problem: { description: @type_problem.description, name: @type_problem.name, scientificName: @type_problem.scientificName, url: @type_problem.url } }
    assert_redirected_to type_problem_url(@type_problem)
  end

  test "should destroy type_problem" do
    assert_difference('TypeProblem.count', -1) do
      delete type_problem_url(@type_problem)
    end

    assert_redirected_to type_problems_url
  end
end
