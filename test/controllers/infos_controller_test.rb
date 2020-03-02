require 'test_helper'

class InfosControllerTest < ActionDispatch::IntegrationTest
  test "should get why" do
    get infos_why_url
    assert_response :success
  end

  test "should get experience" do
    get infos_experience_url
    assert_response :success
  end

  test "should get faq" do
    get infos_faq_url
    assert_response :success
  end

  test "should get account" do
    get infos_account_url
    assert_response :success
  end

  test "should get affiliate" do
    get infos_affiliate_url
    assert_response :success
  end

  test "should get shipping" do
    get infos_shipping_url
    assert_response :success
  end

  test "should get help" do
    get infos_help_url
    assert_response :success
  end

end
