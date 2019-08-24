require 'test_helper'

class GameControllerTest < ActionDispatch::IntegrationTest
  test "should get month" do
    get game_month_url
    assert_response :success
  end

  test "should get create" do
    get game_create_url
    assert_response :success
  end

  test "should get update" do
    get game_update_url
    assert_response :success
  end

end
