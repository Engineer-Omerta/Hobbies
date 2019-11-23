require 'test_helper'

class Admin::HobbiesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get admin_hobbies_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_hobbies_edit_url
    assert_response :success
  end

end
