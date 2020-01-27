require 'test_helper'

class ProductApplicationTest < ActiveSupport::TestCase

  setup do 
    @product_application_one = product_applications(:product_application_one)
    @product_one = products(:product_one)
    @plot_one = plots(:plot_one)
  end

  test "should not save product_application without data" do
    product_application = ProductApplication.new
    assert_not product_application.save
  end

  test "should save product_application with data" do
    product_application = ProductApplication.new({
      product_id: @product_one.id,
      plot_id: @plot_one.id,
      user_id: 1,
      amount: 100,
      comment: "comment"
    })
    assert product_application.save
  end

  test "should save product_application without optional" do
    product_application = ProductApplication.new({
      product_id: @product_one.id,
      plot_id: @plot_one.id,
      user_id: 1,
      amount: 100
    })
    assert product_application.save
  end

  test "should destroy product_application" do
    assert @product_application_one.destroy
  end

end
