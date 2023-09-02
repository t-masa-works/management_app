Rails.application.routes.draw do
  root'tasks#index'
  resources :sessions, only: %i[ new create destroy ]
  resources :users, only: %i[ new create show ]
  resources :tasks

  namespace :admin do
    resources :users
  end
end
