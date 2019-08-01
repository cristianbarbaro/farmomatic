require "application_system_test_case"

class ProductApplicationsTest < ApplicationSystemTestCase
  setup do
    @product_application = product_applications(:one)
  end

  test "visiting the index" do
    visit product_applications_url
    assert_selector "h1", text: "Product Applications"
  end

  test "creating a Product application" do
    visit product_applications_url
    click_on "New Product Application"

    fill_in "Amount", with: @product_application.amount
    fill_in "Comment", with: @product_application.comment
    fill_in "Plot", with: @product_application.plot_id
    fill_in "Product", with: @product_application.product_id
    click_on "Create Product application"

    assert_text "Product application was successfully created"
    click_on "Back"
  end

  test "updating a Product application" do
    visit product_applications_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @product_application.amount
    fill_in "Comment", with: @product_application.comment
    fill_in "Plot", with: @product_application.plot_id
    fill_in "Product", with: @product_application.product_id
    click_on "Update Product application"

    assert_text "Product application was successfully updated"
    click_on "Back"
  end

  test "destroying a Product application" do
    visit product_applications_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Product application was successfully destroyed"
  end
end
