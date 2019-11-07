require 'test_helper'

class User::HobbiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_hobbies_index_url
    assert_response :success
  end

  test "should get new" do
    get user_hobbies_new_url
    assert_response :success
  end

  test "should get create" do
    get user_hobbies_create_url
    assert_response :success
  end

  test "should get show" do
    get user_hobbies_show_url
    assert_response :success
  end

  test "should get main_hobby" do
    get user_hobbies_main_hobby_url
    assert_response :success
  end

end
