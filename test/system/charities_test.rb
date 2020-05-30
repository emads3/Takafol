require "application_system_test_case"

class CharitiesTest < ApplicationSystemTestCase
  setup do
    @charity = charities(:one)
  end

  test "visiting the index" do
    visit charities_url
    assert_selector "h1", text: "Charities"
  end

  test "creating a Charity" do
    visit charities_url
    click_on "New Charity"

    click_on "Create Charity"

    assert_text "Charity was successfully created"
    click_on "Back"
  end

  test "updating a Charity" do
    visit charities_url
    click_on "Edit", match: :first

    click_on "Update Charity"

    assert_text "Charity was successfully updated"
    click_on "Back"
  end

  test "destroying a Charity" do
    visit charities_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Charity was successfully destroyed"
  end
end
