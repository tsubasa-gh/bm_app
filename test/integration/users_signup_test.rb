require "test_helper"

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name:  "",
                                         email: "user@invalid",
                                         password:              "foo",
                                         password_confirmation: "bar",
                                         height: 301.1,
                                         weight: 55,
                                         sex: 3,
                                         age: 120,
                                         purpose: 3,
                                         goal_weight: 0,
                                         activity_level: 10 } }
    end
    assert_response :unprocessable_entity
    assert_template 'users/new'
  end

  test "valid signup information" do
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { name:  "Example User",
                                         email: "user@example.com",
                                         password:              "password",
                                         password_confirmation: "password",
                                         height: 170,
                                         weight: 66.5,
                                         sex: 1,
                                         age: 20,
                                         purpose: -1,
                                         goal_weight: 55,
                                         activity_level: 1.375  } }
    end
    follow_redirect!
    assert_template 'users/show'
    assert is_logged_in?
  end
end
