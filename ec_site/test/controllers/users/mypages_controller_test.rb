require "test_helper"

class Users::MypagesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get users_mypages_show_url
    assert_response :success
  end
end
