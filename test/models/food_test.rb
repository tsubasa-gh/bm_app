require "test_helper"

class FoodTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    @food = @user.foods.build(name: "卵", calorie: 50, protain: 5, fat: 5, carbo: 1.3)
  end

  test "should be valid" do
    assert @food.valid?
  end

  test "user id should be present" do
    @food.user_id = nil
    assert_not @food.valid?
  end

  test "name should be present" do
    @food.name = "     "
    assert_not @food.valid?
  end

  test "name should not be too long" do
    @food.name = "a" * 21
    assert_not @food.valid?
  end

  test "calorie should be present" do
    @food.calorie = "     "
    assert_not @food.valid?
  end

end
