require 'test_helper'

class VendorsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get vendors_new_url
    assert_response :success
  end

  test "should get create" do
    get vendors_create_url
    assert_response :success
  end

  test "should get index" do
    get vendors_index_url
    assert_response :success
  end

  test "should get edit" do
    get vendors_edit_url
    assert_response :success
  end

  test "should get update" do
    get vendors_update_url
    assert_response :success
  end

  test "should get delete" do
    get vendors_delete_url
    assert_response :success
  end

end
