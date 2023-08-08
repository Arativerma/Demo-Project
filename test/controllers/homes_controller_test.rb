require "test_helper"

class HomesControllerTest < ActionDispatch::IntegrationTest
  test "should get page" do
    get homes_page_url
    assert_response :success
  end
end
