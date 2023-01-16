Rails.application.routes.draw do
  resources :doctors, only: [:index, :destroy, :create]
  resources :reservations, only: [:index, :create]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users
  post '/auth/login', to: 'authentication#login'
  # Defines the root path route ("/")
  # root "articles#index"
end
