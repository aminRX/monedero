require 'test_helper'

class PercentCatalogsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get percent_catalogs_new_url
    assert_response :success
  end

  test "should get create" do
    get percent_catalogs_create_url
    assert_response :success
  end

  test "should get show" do
    get percent_catalogs_show_url
    assert_response :success
  end

end
