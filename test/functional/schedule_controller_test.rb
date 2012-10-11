require 'test_helper'

class ScheduleControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should create meals for the week only once" do
    get :index
    assert_equal 7, Meal.all.count
    get :index
    assert_equal 7, Meal.all.count
  end

end
