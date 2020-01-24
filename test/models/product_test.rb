require 'test_helper'

class ProductTest < ActiveSupport::TestCase

  setup do
    @product_one = products(:product_one)
    @product_application_one = product_applications(:product_application_one)
    @product_three = products(:product_three)
  end

  test "should not save product without data" do
    product = Product.new
    assert_not product.save
  end

  test "should save product with correct data" do
    product = Product.new({
      name: "product_name",
      composition: "composition_product",
      description: "description_product"
    })
    assert product.save
  end

  test "should not save product with incorrect data" do
    product = Product.new({
      name: 1,
      composition: "composition_product",
      description: "description_product"
    })
    assert_not product.save
  end

  test "should save product without optionals" do
    product = Product.new({
      name: "product_name",
      composition: "composition_product"
    })
    assert product.save
  end

  test "should destroy product without association" do
    assert @product_three.destroy
  end

  test "should not destroy product with association" do
    assert_not @product_one.destroy
  end
end
