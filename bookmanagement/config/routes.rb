Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :bookdb
  resources :searchbyname
  resources :searchbyauthor
  resources :user
  resources :login
  resources :logout
end
