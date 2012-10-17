class ScheduleController < ApplicationController
  before_filter :set_user_and_build_schedule
  
  def index
    @meals = Meal.find(:all, :conditions => {:date => the_week_of, :name => "lunch", :user_id => @user.id}, :order => 'date')
    @next_weeks_meals = Meal.find(:all, :conditions => {:date => the_week_of(DateTime.now + 7.days), :name => "lunch"})
    @this_week = the_week_of.first
    @food = Food.new

    @food_names = Food.all.map{ |f| f.name }
  end

  def the_week_of(start_date=DateTime.now)
    if params[:date]
      start_date = DateTime.parse(params[:date])
    end
    start_date.beginning_of_week.strftime("%Y-%m-%d")..start_date.end_of_week.strftime("%Y-%m-%d")
  end

  def set_user_and_build_schedule
    @user = User.find_by_handle(params[:handle]) || User.find(params[:handle])
    @user.create_meals_for_next_two_weeks
  end

end