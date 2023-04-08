Rails.application.routes.draw do
  resources :addresses
  resources :order_statuses
  resources :product_orders
  resources :orders
  resources :products
  resources :customers
  resources :restaurants
  resources :employees
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "home#index", as: 'home'
end
