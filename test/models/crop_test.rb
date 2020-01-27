require 'test_helper'

class CropTest < ActiveSupport::TestCase
  
  setup do
    @crop_one = crops(:crop_one)
    @plot_one = plots(:plot_one)
    @variety_one = varieties(:variety_one)
  end

  test "should not save crop without data" do
    crop = Crop.new
    assert_not crop.save
  end

  test "should save crop with data" do
    crop = Crop.new({
      plot_id: @plot_one.id,
      variety_id: @variety_one.id,
      user_id: 1,
      comment: "comment",
      amount: 2
    })
    assert crop.save
  end

  test "should save crop without optionals" do
    crop = Crop.new({
      plot_id: @plot_one.id,
      variety_id: @variety_one.id,
      user_id: 1,
      amount: 2
    })
    assert crop.save
  end

  test "should destroy crop" do
    assert @crop_one.destroy
  end

end
