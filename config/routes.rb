Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registration: 'users/registrations' }
  namespace 'admin' do
    resources :products, only: %w[index show create update destroy] do
      resources :stocks, only: %w[create update]
    end
    resources :regions, only: %w[index show create update destroy] do
      member do
        post :create_product_sets
      end
    end
    resources :stores, only: %w[index show create update destroy]
    resources :users, only: %w[show update]
  end

  namespace 'customer' do
    resources :orders, only: %w[index show create update destroy]
    resources :stores, only: %w[index show create update destroy]
    resources :users, only: %w[show update]
  end
end
