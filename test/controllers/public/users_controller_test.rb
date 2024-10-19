require "test_helper"

class Public::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_users_index_url
    assert_response :success
  end

  test "should get show" do
    get public_users_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_users_edit_url
    assert_response :success
  end

  test "should get update" do
    get public_users_update_url
    assert_response :success
  end

  test "should get search" do
    get public_users_search_url
    assert_response :success
  end

  test "should get check" do
    get public_users_check_url
    assert_response :success
  end

  test "should get out" do
    get public_users_out_url
    assert_response :success
  end
end
