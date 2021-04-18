Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registration: 'users/registrations' }
  namespace 'admin' do
    resources :stocks
    resources :products
    resources :regions do
      member do
        post :create_product_sets
      end
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
