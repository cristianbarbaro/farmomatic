require 'test_helper'

class SpeciesTest < ActiveSupport::TestCase
  setup do
    @species_one = species(:species_one)
    @species_three = species(:species_three)
  end

  test "should not save species without data" do
    species = Species.new
    assert_not species.save
  end

  test "should save species with correct data" do
    species = Species.new({
      name: "name"
    })
    assert species.save
  end

  test "should not save species with incorrect data" do
    species = Species.new({
      name: 1
    })
    assert_not species.save
  end

  test "should destroy species without association" do
    assert @species_three.destroy
  end

  test "should not destroy species with association" do
    assert_not @species_one.destroy
  end
  
end
