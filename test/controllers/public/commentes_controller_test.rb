require "test_helper"

class Public::CommentesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get public_commentes_create_url
    assert_response :success
  end

  test "should get update" do
    get public_commentes_update_url
    assert_response :success
  end

  test "should get destroy" do
    get public_commentes_destroy_url
    assert_response :success
  end
end
