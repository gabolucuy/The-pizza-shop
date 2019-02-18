Rails.application.routes.draw do
  resources :orders do
    member do
      post 'next_state'
    end
  end
  resources :pizza_ingredients
  resources :ingredients
  resources :pizzas do
    member do
      post 'add_ingredient'
      get 'ingredients'
    end
  end
  resources :other_dishes
  resources :sizes
  resources :crusts
  resources :sauces
  resources :cheeses
  resources :pizza_types
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
