TinymealRails::Application.routes.draw do
  get "schedule/index"

  resources :foods

  resources :meals

  
  match '/create_meals_for_the_week' => 'schedule#create_meals_for_the_week'
  root :to => 'schedule#index'



  match "/foodnames" => 'foods#food_names'

end
