require 'test_helper'

class User::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get user_users_edit_url
    assert_response :success
  end

  test "should get update" do
    get user_users_update_url
    assert_response :success
  end

  test "should get show" do
    get user_users_show_url
    assert_response :success
  end

  test "should get follows" do
    get user_users_follows_url
    assert_response :success
  end

  test "should get followers" do
    get user_users_followers_url
    assert_response :success
  end

  test "should get mypage" do
    get user_users_mypage_url
    assert_response :success
  end

  test "should get unsubscribe" do
    get user_users_unsubscribe_url
    assert_response :success
  end

end
