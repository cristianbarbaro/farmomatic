require "application_system_test_case"

class VarietiesTest < ApplicationSystemTestCase
  setup do
    @variety = varieties(:one)
  end

  test "visiting the index" do
    visit varieties_url
    assert_selector "h1", text: "Varieties"
  end

  test "creating a Variety" do
    visit varieties_url
    click_on "New Variety"

    fill_in "Description", with: @variety.description
    fill_in "Name", with: @variety.name
    fill_in "scientific_name", with: @variety.scientific_name
    fill_in "Url", with: @variety.url
    click_on "Create Variety"

    assert_text "Variety was successfully created"
    click_on "Back"
  end

  test "updating a Variety" do
    visit varieties_url
    click_on "Edit", match: :first

    fill_in "Description", with: @variety.description
    fill_in "Name", with: @variety.name
    fill_in "scientific_name", with: @variety.scientific_name
    fill_in "Url", with: @variety.url
    click_on "Update Variety"

    assert_text "Variety was successfully updated"
    click_on "Back"
  end

  test "destroying a Variety" do
    visit varieties_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Variety was successfully destroyed"
  end
end
