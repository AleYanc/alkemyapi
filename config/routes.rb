Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'auth', to: 'auth#create'
      resources :studios
      resources :productions
      resources :characters
      resources :genres
      resources :users
    end
  end
end
