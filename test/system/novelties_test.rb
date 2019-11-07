require "application_system_test_case"

class NoveltiesTest < ApplicationSystemTestCase
  setup do
    @novelty = novelties(:one)
  end

  test "visiting the index" do
    visit novelties_url
    assert_selector "h1", text: "Novelties"
  end

  test "creating a Novelty" do
    visit novelties_url
    click_on "New Novelty"

    fill_in "Body", with: @novelty.body
    fill_in "Title", with: @novelty.title
    fill_in "User", with: @novelty.user_id
    click_on "Create Novelty"

    assert_text "Novelty was successfully created"
    click_on "Back"
  end

  test "updating a Novelty" do
    visit novelties_url
    click_on "Edit", match: :first

    fill_in "Body", with: @novelty.body
    fill_in "Title", with: @novelty.title
    fill_in "User", with: @novelty.user_id
    click_on "Update Novelty"

    assert_text "Novelty was successfully updated"
    click_on "Back"
  end

  test "destroying a Novelty" do
    visit novelties_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Novelty was successfully destroyed"
  end
end
