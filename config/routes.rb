Rails.application.routes.draw do
  resources :order_products
  resources :orders
  resources :stocks
  resources :product_sets
  resources :products
  resources :regions
  resources :stores
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
