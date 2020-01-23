require 'test_helper'

class PlotsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:owner_user)
    @plot_one = plots(:plot_one)
    @plot_three = plots(:plot_three)
  end

  test "should get index" do
    get farm_plots_url(farm_id: 1)
    assert_response :success
  end

  test "should get new" do
    get new_farm_plot_url(farm_id: 1)
    assert_response :success
  end

  test "should create plot" do
    assert_difference('Plot.count') do
      post farm_plots_url(farm_id: 1), params: {plot: { description: @plot_one.description, greenhouse: @plot_one.greenhouse, identifier: @plot_one.identifier, surface: @plot_one.surface } }
    end
    assert_redirected_to farm_plots_url(farm_id: 1)
  end

  test "should show plot" do
    get farm_plot_url( 1, @plot_one)
    assert_response :success
  end

  test "should get edit" do
    get edit_farm_plot_url(1, @plot_one)
    assert_response :success
  end

  test "should update plot" do
    patch farm_plot_url(1, @plot_one), params: { plot: { description: @plot_one.description, greenhouse: @plot_one.greenhouse, identifier: @plot_one.identifier, surface: @plot_one.surface } }
    assert_redirected_to farm_plot_url(1, @plot_one)
  end

  
  #test "should destroy plot without association" do
  #  assert_difference('Plot.count', -1) do
  #    delete farm_plot_url(2, @plot_three)
  #  end
  #
  #  assert_redirected_to farm_plots_url(farm_id: 2)
  #end

  test "should not destroy plot with plantation" do
    assert_raises(ActiveRecord::InvalidForeignKey) do
      delete farm_plot_url(1, @plot_one)
    end
  end

end
