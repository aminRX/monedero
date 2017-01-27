require 'test_helper'

class BalancesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get balances_new_url
    assert_response :success
  end

  test "should get create" do
    get balances_create_url
    assert_response :success
  end

end
