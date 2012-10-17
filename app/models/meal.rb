class Meal < ActiveRecord::Base
  attr_accessible :date, :name, :user_id
  belongs_to :user
  has_and_belongs_to_many :foods
  validates_presence_of :user
  def foods_not_in_meal
    return Food.all if foods.empty?
    Food.all.reject! {|f| foods.include?(f) }
  end
end
