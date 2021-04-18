Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  namespace 'admin' do
    resources :stocks
    resources :products
    resources :regions do
      resources :product_sets
    end
    resources :stores
    resources :users
  end

  namespace 'customer' do
    resources :order_products
    resources :orders
    resources :stores
    resources :users
  end
end
