class User < ActiveRecord::Base
  attr_accessible :email, :handle
  has_many :meals
  validates_presence_of :handle
  validates_uniqueness_of :handle
  # validate valid url option

  def create_meals_for_next_two_weeks
    [DateTime.now, DateTime.now + 7.days].each do |date|
      date_range = date.beginning_of_week.strftime("%Y-%m-%d")..date.end_of_week.strftime("%Y-%m-%d")
      date_range.each do |day|
        day = Date.parse(day)
        @meals = Meal.find(:all, :conditions => {:date => day.beginning_of_day..day.end_of_day, :user_id => id})
        if @meals.empty?
          Meal.create({:date => day, :name => "lunch", :user_id => id})
        end
      end
    end
  end

end
