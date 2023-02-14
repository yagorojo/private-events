Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'events#index'
  resources :users, only: [:show]
  resources :attendances, only: [:create, :destroy]
  resources :events, except: [:update]
end
