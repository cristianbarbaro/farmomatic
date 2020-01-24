require 'test_helper'

class TypeProblemTest < ActiveSupport::TestCase

  setup do
    @type_problem_one = type_problems(:type_problem_one)
    @type_problem_three = type_problems(:type_problem_three)
    #@problem_one = problems(:problem_one)
  end

  test "should not save type_problem without data" do
    type_problem = TypeProblem.new
    assert_not type_problem.save
  end

  test "should save type_problem with data" do
    type_problem = TypeProblem.new({
      name: "name",
      scientific_name: "scientific_name",
      url: "url",
      description: "description"
    })
    assert type_problem.save
  end

  test "should save type_problem without optionals" do
    type_problem = TypeProblem.new({
      name: "name",
      scientific_name: "scientific_name"
    })
    assert type_problem.save
  end

  test "should not save type_problem with incorrect data" do
    type_problem = TypeProblem.new({
      name: 1,
      scientific_name: "scientific_name",
      url: "url",
      description: "description"
    })
    assert_not type_problem.save
  end

  test "should destroy type_problem without association" do
    assert @type_problem_three.destroy
  end

  test "should not destroy type_problem with association" do
    assert_not @type_problem_one.destroy
  end

end
