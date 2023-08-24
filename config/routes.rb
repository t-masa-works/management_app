Rails.application.routes.draw do
  root'tasks#index'
  resources :sessions, only: [:new, :create ,:destroy]
  resources :users, only: [:new,  :create, :show]
  resources :tasks

  namespace :admin do
    resources :users
  end
end
