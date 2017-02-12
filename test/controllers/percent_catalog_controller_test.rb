require 'test_helper'

class PercentCatalogControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get percent_catalog_new_url
    assert_response :success
  end

  test "should get create" do
    get percent_catalog_create_url
    assert_response :success
  end

  test "should get show" do
    get percent_catalog_show_url
    assert_response :success
  end

end
