require 'test_helper'

class PlantationTest < ActiveSupport::TestCase

  setup do
    @plantation_one = plantations(:plantation_one)
    @plot_one = plots(:plot_one)
    @species_one = species(:species_one)
  end

  test "should not save plantation without data" do
    plantation = Plantation.new
    assert_not plantation.save
  end

  test "should save plantation with data" do
    plantation = Plantation.new({
      plot_id: @plot_one.id,
      species_id: @species_one.id,
      user_id: 1,
      amount: 20.5,
      comment: "comment"
    })
    assert plantation.save
  end

  test "should save plantation without optional" do
    plantation = Plantation.new({
      plot_id: @plot_one.id,
      species_id: @species_one.id,
      user_id: 1,
      amount: 20.5
    })
    assert plantation.save
  end

  test "should destroy plantation" do
    assert @plantation_one.destroy
  end

end
