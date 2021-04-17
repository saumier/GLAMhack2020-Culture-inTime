require "application_system_test_case"

class SpotlightsTest < ApplicationSystemTestCase
  setup do
    @spotlight = spotlights(:one)
  end

  test "visiting the index" do
    visit spotlights_url
    assert_selector "h1", text: "Spotlights"
  end

  test "creating a Spotlight" do
    visit spotlights_url
    click_on "New Spotlight"

    fill_in "Description", with: @spotlight.description
    fill_in "End date", with: @spotlight.end_date
    fill_in "Image", with: @spotlight.image
    fill_in "Location", with: @spotlight.location
    fill_in "Query", with: @spotlight.query
    fill_in "Start date", with: @spotlight.start_date
    fill_in "Subtitle", with: @spotlight.subtitle
    fill_in "Title", with: @spotlight.title
    click_on "Create Spotlight"

    assert_text "Spotlight was successfully created"
    click_on "Back"
  end

  test "updating a Spotlight" do
    visit spotlights_url
    click_on "Edit", match: :first

    fill_in "Description", with: @spotlight.description
    fill_in "End date", with: @spotlight.end_date
    fill_in "Image", with: @spotlight.image
    fill_in "Location", with: @spotlight.location
    fill_in "Query", with: @spotlight.query
    fill_in "Start date", with: @spotlight.start_date
    fill_in "Subtitle", with: @spotlight.subtitle
    fill_in "Title", with: @spotlight.title
    click_on "Update Spotlight"

    assert_text "Spotlight was successfully updated"
    click_on "Back"
  end

  test "destroying a Spotlight" do
    visit spotlights_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Spotlight was successfully destroyed"
  end
end
