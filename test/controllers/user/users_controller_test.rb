require 'test_helper'

class User::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get user_hobbies" do
    get user_users_user_hobbies_url
    assert_response :success
  end

end
