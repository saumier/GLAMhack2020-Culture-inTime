require 'test_helper'

class ProductionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @production = productions(:one)
  end

  test "should get index" do
    get productions_url
    assert_response :success
  end

  test "should get new" do
    get new_production_url
    assert_response :success
  end

  test "should create production" do
    assert_difference('Production.count') do
      post productions_url, params: { production: { data_source_id: data_sources(:one).id, date_of_first_performance: @production.date_of_first_performance, description: @production.description, label: @production.label, location_label: @production.location_label, location_uri: @production.location_uri, main_image: @production.main_image, production_company_label: @production.production_company_label, production_company_uri: @production.production_company_uri } }
    end

    assert_redirected_to production_url(Production.last)
  end

  test "should show production" do
    get production_url(@production)
    assert_response :success
  end

  test "should get edit" do
    get edit_production_url(@production)
    assert_response :success
  end

  test "should update production" do
    patch production_url(@production), params: { production: { data_source_id: data_sources(:one).id, date_of_first_performance: @production.date_of_first_performance, description: @production.description, label: @production.label, location_label: @production.location_label, location_uri: @production.location_uri, main_image: @production.main_image, production_company_label: @production.production_company_label, production_company_uri: @production.production_company_uri } }
    assert_redirected_to production_url(@production)
  end

  test "should destroy production" do
    assert_difference('Production.count', -1) do
      delete production_url(@production)
    end

    assert_redirected_to productions_url
  end
end
