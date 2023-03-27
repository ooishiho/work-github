require "test_helper"

class Admain::ItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admain_items_new_url
    assert_response :success
  end

  test "should get index" do
    get admain_items_index_url
    assert_response :success
  end

  test "should get create" do
    get admain_items_create_url
    assert_response :success
  end

  test "should get show" do
    get admain_items_show_url
    assert_response :success
  end

  test "should get edit" do
    get admain_items_edit_url
    assert_response :success
  end

  test "should get update" do
    get admain_items_update_url
    assert_response :success
  end
end
