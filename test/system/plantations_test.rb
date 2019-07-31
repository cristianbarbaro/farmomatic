require "application_system_test_case"

class PlantationsTest < ApplicationSystemTestCase
  setup do
    @plantation = plantations(:one)
  end

  test "visiting the index" do
    visit plantations_url
    assert_selector "h1", text: "Plantations"
  end

  test "creating a Plantation" do
    visit plantations_url
    click_on "New Plantation"

    fill_in "Amount", with: @plantation.amount
    fill_in "Comment", with: @plantation.comment
    fill_in "Plot", with: @plantation.plot_id
    fill_in "Species", with: @plantation.species_id
    click_on "Create Plantation"

    assert_text "Plantation was successfully created"
    click_on "Back"
  end

  test "updating a Plantation" do
    visit plantations_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @plantation.amount
    fill_in "Comment", with: @plantation.comment
    fill_in "Plot", with: @plantation.plot_id
    fill_in "Species", with: @plantation.species_id
    click_on "Update Plantation"

    assert_text "Plantation was successfully updated"
    click_on "Back"
  end

  test "destroying a Plantation" do
    visit plantations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Plantation was successfully destroyed"
  end
end
