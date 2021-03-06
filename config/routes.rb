Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'
      resources :recipes do
        resources :comments, only: %i[create]
        resources :rates, only: %i[create]
      end
      resources :products
    end
  end
end
