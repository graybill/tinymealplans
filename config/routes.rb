TinymealRails::Application.routes.draw do
  get "welcome/index"

  resources :users
  
  scope ":handle", :as => "user" do
    resources :schedule
  end
  
  resources :foods, :meals

  root :to => 'welcome#index'
  
  match '/create_meals_for_the_week' => 'schedule#create_meals_for_the_week'
  match '/remove_food_from_meal' => 'foods#remove_food_from_meal'
  match "/foodnames" => 'foods#food_names'

end
