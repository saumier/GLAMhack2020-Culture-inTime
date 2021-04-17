require 'test_helper'

class SpotlightsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @spotlight = spotlights(:one)
  end

  test "should get index" do
    get spotlights_url
    assert_response :success
  end

  test "should get new" do
    get new_spotlight_url
    assert_response :success
  end

  test "should create spotlight" do
    assert_difference('Spotlight.count') do
      post spotlights_url, params: { spotlight: { description: @spotlight.description, end_date: @spotlight.end_date, image: @spotlight.image, location: @spotlight.location, query: @spotlight.query, start_date: @spotlight.start_date, subtitle: @spotlight.subtitle, title: @spotlight.title } }
    end

    assert_redirected_to spotlight_url(Spotlight.last)
  end

  test "should show spotlight" do
    get spotlight_url(@spotlight)
    assert_response :success
  end

  test "should get edit" do
    get edit_spotlight_url(@spotlight)
    assert_response :success
  end

  test "should update spotlight" do
    patch spotlight_url(@spotlight), params: { spotlight: { description: @spotlight.description, end_date: @spotlight.end_date, image: @spotlight.image, location: @spotlight.location, query: @spotlight.query, start_date: @spotlight.start_date, subtitle: @spotlight.subtitle, title: @spotlight.title } }
    assert_redirected_to spotlight_url(@spotlight)
  end

  test "should destroy spotlight" do
    assert_difference('Spotlight.count', -1) do
      delete spotlight_url(@spotlight)
    end

    assert_redirected_to spotlights_url
  end
end
