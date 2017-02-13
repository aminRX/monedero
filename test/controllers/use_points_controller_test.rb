require 'test_helper'

class UsePointsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get use_points_new_url
    assert_response :success
  end

  test "should get create" do
    get use_points_create_url
    assert_response :success
  end

  test "should get edit" do
    get use_points_edit_url
    assert_response :success
  end

  test "should get update" do
    get use_points_update_url
    assert_response :success
  end

end
