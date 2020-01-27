require 'test_helper'

class ProblemTest < ActiveSupport::TestCase
  setup do
    @problem_one = problems(:problem_one)
    @type_problem_one = type_problems(:type_problem_one)
    @plot_one = plots(:plot_one)
  end

  test "should not save problem without data" do
    problem = Problem.new
    assert_not problem.save
  end

  test "should save problem with data" do
    problem = Problem.new({
      type_problem_id: @type_problem_one.id,
      plot_id: @plot_one.id,
      user_id: 1,
      comment: "comment"
    })
    assert problem.save
  end

  test "should save problem without optionals" do
    problem = Problem.new({
      type_problem_id: @type_problem_one.id,
      plot_id: @plot_one.id,
      user_id: 1,
    })
    assert problem.save
  end

  test "should destroy problem" do
    assert @problem_one.destroy
  end

end
