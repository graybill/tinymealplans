class CreateFoodsMeals < ActiveRecord::Migration
  def change
    create_table :foods_meals do |t|
      t.string :food_id
      t.string :meal_id
    end
  end
end
