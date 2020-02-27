require 'test_helper'

class HairsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get hairs_index_url
    assert_response :success
  end

  test "should get show" do
    get hairs_show_url
    assert_response :success
  end

  test "should get destroy" do
    get hairs_destroy_url
    assert_response :success
  end

  test "should get edit" do
    get hairs_edit_url
    assert_response :success
  end

  test "should get update" do
    get hairs_update_url
    assert_response :success
  end

  test "should get newcreate" do
    get hairs_newcreate_url
    assert_response :success
  end

end
