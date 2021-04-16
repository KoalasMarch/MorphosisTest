Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  scope module: :admin do
    resources :stocks
    resources :product_sets
    resources :products
    resources :regions
    resources :stores
    resources :users
  end

  scope module: :customer do
    resources :order_products
    resources :orders
  end
end
