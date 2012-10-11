class Food < ActiveRecord::Base
  attr_accessible :name, :meal_ids
  has_and_belongs_to_many :meals
  validates_presence_of :name
  validates_uniqueness_of :name
end
