require "test_helper"

class Admin::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get manage" do
    get admin_users_manage_url
    assert_response :success
  end
end
