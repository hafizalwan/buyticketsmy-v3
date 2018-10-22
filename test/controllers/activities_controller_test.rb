require 'test_helper'

class ActivitiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get activities_index_url
    assert_response :success
  end

  test "should get new" do
    get activities_new_url
    assert_response :success
  end

  test "should get create" do
    get activities_create_url
    assert_response :success
  end

  test "should get update" do
    get activities_update_url
    assert_response :success
  end

  test "should get show" do
    get activities_show_url
    assert_response :success
  end

  test "should get description" do
    get activities_description_url
    assert_response :success
  end

  test "should get photos" do
    get activities_photos_url
    assert_response :success
  end

  test "should get location" do
    get activities_location_url
    assert_response :success
  end

  test "should get price" do
    get activities_price_url
    assert_response :success
  end

end
