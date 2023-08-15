Rails.application.routes.draw do
  devise_for :users

  resources :balances, only: %i[index show new create] do
    resources :items, only: %i[new create]
  end

  root 'balance#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  get '/home', to: 'home#index'
end
