require 'test_helper'

class PlotTest < ActiveSupport::TestCase

  setup do
    @plot_one = plots(:plot_one)
    @plot_three = plots(:plot_three)
    @farm_one = farms(:farm_owner_user)
  end

  test "should not save plot without data" do
    plot = Plot.new
    assert_not plot.save
  end

  test "should save plot with data" do
    plot = Plot.new({
      identifier: "identifier",
      description: "description",
      surface: 150.50,
      greenhouse: false,
      farm_id: @farm_one.id
    })
    assert plot.save
  end

  test "should destroy plot without associations" do
    assert @plot_three.destroy
  end

  test "should not destroy plot with associations" do
    assert_not @plot_one.destroy
  end

end
