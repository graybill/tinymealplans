class ScheduleController < ApplicationController
  before_filter :create_meals_for_the_week
  
  def index
    @meals = Meal.find(:all, :conditions => {:date => the_week_of, :name => "lunch"})
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

  def create_meals_for_the_week
    the_week_of.each do |day|
      day = Date.parse(day)
      @meals = Meal.find(:all, :conditions => {:date => day.beginning_of_day..day.end_of_day})
      if @meals.empty?
        Meal.create({:date => day, :name => "lunch"})
      end
    end
  end

end