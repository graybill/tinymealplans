TinymealRails::Application.routes.draw do
  get "schedule/index"

  resources :foods

  resources :meals
  root :to => 'schedule#index'

end
