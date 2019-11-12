require 'test_helper'

class User::MatchesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_matches_index_url
    assert_response :success
  end

end
