class CreateFoodsMeals < ActiveRecord::Migration
  def change
    create_table :foods_meals, :id => false do |t|
      t.integer :food_id
      t.integer :meal_id
    end
  end
end
