Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'api'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v0 do
      resources :pings, only: [:index], constraints: { format: 'json' }
    end

    namespace :v1, default: {format: :json}do
      mount_devise_token_auth_for 'User', at: 'auth', skip: [:omniauth_callbacks]
    end

  end

  root to: 'home#index'
end
