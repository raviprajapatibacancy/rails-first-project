Rails.application.routes.draw do
  resources :phsicians
  resources :patients
  resources :tags
  resources :categories
  #resources :blogs
  resources :appointments
  resources :blogs do
    member do
      get :get_dataset
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "signup", to: "users#new"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  get "logout", to: "sessions#destroy"
  get "dashboard", to: "dashboard#index"
  resources :users, except: [:new]
end
