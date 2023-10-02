require "test_helper"

class UsersEditTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end

  test "unsuccessful edit" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: { user: { name:  "",
                                         email: "user@invalid",
                                         password:              "foo",
                                         password_confirmation: "bar",
                                         height: 301.1,
                                         weight: "invalid",
                                         sex: "invalid",
                                         age: "invalid",
                                         purpose: "invalid",
                                         goal_weight: "invalid",
                                         activity_level: "invalid" } }

    assert_template 'users/edit'
  end

  test "successful edit" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    name  = "Foo Bar"
    email = "foo@bar.com"
    height = 200
    weight = 90.5
    sex = 2
    age = 55
    purpose = 1
    goal_weight = 100.5
    activity_level = 1.9
    patch user_path(@user), params: { user: { name:  name,
                                              email: email,
                                              password:              "",
                                              password_confirmation: "",
                                              height: height,
                                              weight: weight,
                                              sex: sex,
                                              age: age,
                                              purpose: purpose,
                                              goal_weight: goal_weight,
                                              activity_level: activity_level  } }
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal name,  @user.name
    assert_equal email, @user.email
    assert_equal height, @user.height
    assert_equal weight, @user.weight
    assert_equal sex, @user.sex
    assert_equal age, @user.age
    assert_equal purpose, @user.purpose
    assert_equal activity_level, @user.activity_level
  end
end
