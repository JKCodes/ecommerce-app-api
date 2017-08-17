Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do

      # /api/v1/users
      resources :users, only: [:create]

      # /api/v1/auth
      post '/auth', to: 'auth#login'
      post '/auth/refresh', to: "auth#refresh"
      post '/auth/fetch', to: "auth#fetch"

      # /api/v1/carts
      resources :carts, only: [:show, :update]
    end
  end
end
