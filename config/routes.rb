TinymealRails::Application.routes.draw do
  get "schedule/index"

  resources :foods

  resources :meals
  root :to => 'schedule#index'

  match "/foodnames" => 'foods#food_names'

end
