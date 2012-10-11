class ScheduleController < ApplicationController
  before_filter :create_meals_for_the_week
  
  def index
    @meals = Meal.find(:all, :conditions => {:date => this_week, :name => "lunch"})
    @this_week = this_week.first
    @food = Food.new
  end

  def create_meals_for_the_week    
    this_week.each do |day|
      day = Date.parse(day)
      @meals = Meal.find(:all, :conditions => {:date => day.beginning_of_day..day.end_of_day})
      if @meals.empty?
        Meal.create({:date => day, :name => "lunch"})
      end
    end
  end

end