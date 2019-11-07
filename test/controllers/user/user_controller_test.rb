require 'test_helper'

class User::UserControllerTest < ActionDispatch::IntegrationTest
  test "should get bought_items" do
    get user_user_bought_items_url
    assert_response :success
  end

  test "should get day_bought_items" do
    get user_user_day_bought_items_url
    assert_response :success
  end

end
