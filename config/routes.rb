Rails.application.routes.draw do
  get :login, to: 'sessions#new'
  get :logout, to: 'sessions#destroy'
  resources :sessions
  resources :users
  root to: 'users#index'

end
