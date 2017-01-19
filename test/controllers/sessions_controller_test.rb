require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get signin" do
    get sessions_signin_url
    assert_response :success
  end

  test "should get signup" do
    get sessions_signup_url
    assert_response :success
  end

  test "should get signout" do
    get sessions_signout_url
    assert_response :success
  end

end
