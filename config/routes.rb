Rails.application.routes.draw do
  devise_for :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :balance do
    resources :item
  end

  # Defines the root path route ("/")
  get '/home', to: 'home#index'
  root 'balance#index'
end
