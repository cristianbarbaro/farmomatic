require "application_system_test_case"

class TypeProblemsTest < ApplicationSystemTestCase
  setup do
    @type_problem = type_problems(:one)
  end

  test "visiting the index" do
    visit type_problems_url
    assert_selector "h1", text: "Type Problems"
  end

  test "creating a Type problem" do
    visit type_problems_url
    click_on "New Type Problem"

    fill_in "Description", with: @type_problem.description
    fill_in "Name", with: @type_problem.name
    fill_in "Scientificname", with: @type_problem.scientificName
    fill_in "Url", with: @type_problem.url
    click_on "Create Type problem"

    assert_text "Type problem was successfully created"
    click_on "Back"
  end

  test "updating a Type problem" do
    visit type_problems_url
    click_on "Edit", match: :first

    fill_in "Description", with: @type_problem.description
    fill_in "Name", with: @type_problem.name
    fill_in "Scientificname", with: @type_problem.scientificName
    fill_in "Url", with: @type_problem.url
    click_on "Update Type problem"

    assert_text "Type problem was successfully updated"
    click_on "Back"
  end

  test "destroying a Type problem" do
    visit type_problems_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Type problem was successfully destroyed"
  end
end
