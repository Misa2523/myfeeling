require "test_helper"

class Public::FeelingPostsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_feeling_posts_new_url
    assert_response :success
  end

  test "should get create" do
    get public_feeling_posts_create_url
    assert_response :success
  end

  test "should get index" do
    get public_feeling_posts_index_url
    assert_response :success
  end

  test "should get show" do
    get public_feeling_posts_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_feeling_posts_edit_url
    assert_response :success
  end

  test "should get update" do
    get public_feeling_posts_update_url
    assert_response :success
  end

  test "should get destroy" do
    get public_feeling_posts_destroy_url
    assert_response :success
  end

  test "should get search" do
    get public_feeling_posts_search_url
    assert_response :success
  end
end
