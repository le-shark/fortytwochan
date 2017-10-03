require 'test_helper'

class ModerationControllerTest < ActionDispatch::IntegrationTest
  test "should get remove_posts" do
    get moderation_remove_posts_url
    assert_response :success
  end

end
