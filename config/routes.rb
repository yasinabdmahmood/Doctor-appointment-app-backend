Rails.application.routes.draw do
  get 'render/index'
  resources :doctors, only: [:index, :destroy, :create]
  resources :reservations, only: [:index, :create]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show, :create ]
  post '/auth/login', to: 'authentication#login'
  root 'render#index'
  # Defines the root path route ("/")
  # root "articles#index"
end
