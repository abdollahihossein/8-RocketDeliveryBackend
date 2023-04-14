Rails.application.routes.draw do
  root to: "home#index", as: 'home'
  
  namespace :api do
    post '/login' => 'auth#index'
    get '/products' => 'products#index'
    get '/restaurants' => 'restaurants#index'
  end

  resources :courier_statuses
  resources :couriers
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
end
