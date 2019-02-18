Rails.application.routes.draw do
  resources :pizza_ingredients
  resources :ingredients
  resources :pizzas
  resources :other_dishes
  resources :sizes
  resources :crusts
  resources :sauces
  resources :cheeses
  resources :pizza_types
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
