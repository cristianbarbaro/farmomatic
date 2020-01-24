require 'test_helper'

class FarmTest < ActiveSupport::TestCase

  setup do
    @farm_one = farms(:farm_owner_user)
  end

  test "should not save farm without data" do
    farm = Farm.new
    assert_not farm.save
  end

  test "should save farm with data" do
    farm = Farm.new({
      name: "name",
      description: "description",
      address: "address"
    })
    assert farm.save
  end

end
