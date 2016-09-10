require 'test_helper'

class NamespaceControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get namespace_index_url
    assert_response :success
  end

  test "should get create" do
    get namespace_create_url
    assert_response :success
  end

  test "should get edit" do
    get namespace_edit_url
    assert_response :success
  end

  test "should get update" do
    get namespace_update_url
    assert_response :success
  end

  test "should get destroy" do
    get namespace_destroy_url
    assert_response :success
  end

end
