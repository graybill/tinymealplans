require 'test_helper'

class ScheduleControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should create meals only once" do
    get :index
    assert_equal 14, Meal.all.count
    get :index # visit index again
    assert_equal 14, Meal.all.count
  end

end
