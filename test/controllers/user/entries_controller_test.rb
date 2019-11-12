require 'test_helper'

class User::EntriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_entries_index_url
    assert_response :success
  end

end
