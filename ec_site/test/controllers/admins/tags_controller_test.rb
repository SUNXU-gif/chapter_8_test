require "test_helper"

class Admins::TagsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_tags_index_url
    assert_response :success
  end

  test "should get new" do
    get admins_tags_new_url
    assert_response :success
  end

  test "should get create" do
    get admins_tags_create_url
    assert_response :success
  end

  test "should get destroy" do
    get admins_tags_destroy_url
    assert_response :success
  end
end
