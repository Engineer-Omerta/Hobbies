require 'test_helper'

class User::HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get user_home_top_url
    assert_response :success
  end

  test "should get index" do
    get user_home_index_url
    assert_response :success
  end

  test "should get hobby" do
    get user_home_hobby_url
    assert_response :success
  end

  test "should get location" do
    get user_home_location_url
    assert_response :success
  end

end
