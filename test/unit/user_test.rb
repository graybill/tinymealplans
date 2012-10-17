require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "should create meals only once" do
    @user = FactoryGirl.create(:user)
    @user.create_meals_for_next_two_weeks
    assert_equal 14, @user.meals.count
    @user.create_meals_for_next_two_weeks #run again
    assert_equal 14, @user.meals.count
  end

end
