require 'test_helper'

class VarietyTest < ActiveSupport::TestCase
  setup do
    @variety_one = varieties(:variety_one)
    @variety_three = varieties(:variety_three) # no tiene asociaciones
    @crop_one = crops(:crop_one) # tiene a plot_one
    @novelty_two = novelties(:novelty_two) # tiene variety_one
  end

  test "should not save variety without data" do
    variety = Variety.new
    assert_not variety.save
  end

  test "should save variety with correct data" do
    variety = Variety.new({
      name: "new",
      scientific_name: "scientific name",
      url: "http://url",
      description: "description"
    })
    assert variety.save
  end

  test "should save variety with correct data and without optionals" do
    variety = Variety.new({
      name: "new",
      scientific_name: "scientific name"
    })
    assert variety.save
  end

  test "should not save variety with incorrect data" do
    variety = Variety.new({
      name: 1,
      scientific_name: 1
    })
    assert_not variety.save
  end

  test "should destroy variety without association" do
    assert @variety_three.destroy
  end

  test "should not destroy variety with association" do
    assert_not @variety_one.destroy
  end

end
