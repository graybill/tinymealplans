require 'test_helper'

class ScheduleHelperTest < ActionView::TestCase

  test "returns food icon" do
    assert_equal "images/food-icons/ChineseCabbage.gif", food_icon(FactoryGirl.create(:food, :name => "ChineseCabbage"))
    assert_equal "images/food-icons/ChineseCabbage.gif", food_icon(FactoryGirl.create(:food, :name => "ChineseCabbages"))
    assert_equal "images/food-icons/Carrot.gif", food_icon(FactoryGirl.create(:food, :name => "carrot"))
  end

end
