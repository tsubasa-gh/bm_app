require "test_helper"

class HomesControllerTest < ActionDispatch::IntegrationTest
  test  "should get root" do
    get root_url
    assert_response :success
  end

  test  "should get home" do
    get homes_home_url
    assert_response :success
  end
end
