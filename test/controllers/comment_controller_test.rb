require 'test_helper'

class CommentControllerTest < ActionDispatch::IntegrationTest
  test "should get detail" do
    get comment_detail_url
    assert_response :success
  end

end
