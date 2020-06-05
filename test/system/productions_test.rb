require "application_system_test_case"

class ProductionsTest < ApplicationSystemTestCase
  setup do
    @production = productions(:one)
  end

  test "visiting the index" do
    visit productions_url
    assert_selector "h1", text: "Productions"
  end

  test "creating a Production" do
    visit productions_url
    click_on "New Production"

    fill_in "Date of first performance", with: @production.date_of_first_performance
    fill_in "Description", with: @production.description
    fill_in "Label", with: @production.label
    fill_in "Location label", with: @production.location_label
    fill_in "Location uri", with: @production.location_uri
    fill_in "Main image", with: @production.main_image
    fill_in "Production company label", with: @production.production_company_label
    fill_in "Production company uri", with: @production.production_company_uri
    click_on "Create Production"

    assert_text "Production was successfully created"
    click_on "Back"
  end

  test "updating a Production" do
    visit productions_url
    click_on "Edit", match: :first

    fill_in "Date of first performance", with: @production.date_of_first_performance
    fill_in "Description", with: @production.description
    fill_in "Label", with: @production.label
    fill_in "Location label", with: @production.location_label
    fill_in "Location uri", with: @production.location_uri
    fill_in "Main image", with: @production.main_image
    fill_in "Production company label", with: @production.production_company_label
    fill_in "Production company uri", with: @production.production_company_uri
    click_on "Update Production"

    assert_text "Production was successfully updated"
    click_on "Back"
  end

  test "destroying a Production" do
    visit productions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Production was successfully destroyed"
  end
end
