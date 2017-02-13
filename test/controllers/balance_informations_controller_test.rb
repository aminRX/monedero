require 'test_helper'

class BalanceInformationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @balance_information = balance_informations(:one)
  end

  test "should get index" do
    get balance_informations_url
    assert_response :success
  end

  test "should get new" do
    get new_balance_information_url
    assert_response :success
  end

  test "should create balance_information" do
    assert_difference('BalanceInformation.count') do
      post balance_informations_url, params: { balance_information: {  } }
    end

    assert_redirected_to balance_information_url(BalanceInformation.last)
  end

  test "should show balance_information" do
    get balance_information_url(@balance_information)
    assert_response :success
  end

  test "should get edit" do
    get edit_balance_information_url(@balance_information)
    assert_response :success
  end

  test "should update balance_information" do
    patch balance_information_url(@balance_information), params: { balance_information: {  } }
    assert_redirected_to balance_information_url(@balance_information)
  end

  test "should destroy balance_information" do
    assert_difference('BalanceInformation.count', -1) do
      delete balance_information_url(@balance_information)
    end

    assert_redirected_to balance_informations_url
  end
end
