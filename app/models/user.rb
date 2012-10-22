class User < ActiveRecord::Base
  attr_accessible :email, :handle
  has_many :meals
  validates_presence_of :handle
  validates_uniqueness_of :handle
  # validate valid url option

  def to_param  # overridden
    handle
  end

  def create_meals_for_next_two_weeks
    [DateTime.now..DateTime.now + 14.days].each do |date|
      date.each do |day|
        begin
          day = Date.parse(day.strftime("%Y-%m-%d"))
          @meals = Meal.find(:all, :conditions => {:date => day.beginning_of_day..day.end_of_day, :user_id => id})
          if @meals.empty?
            Meal.create({:date => day, :name => "lunch", :user_id => id})
          end          
        rescue Exception => e
          raise e.inspect
        end
      end
    end
  end

end
