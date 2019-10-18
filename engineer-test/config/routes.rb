Rails.application.routes.draw do
  devise_for :users
  root to: 'tweets#index'
  resources :tweets, only: %i[index create destroy]
  resources :tags, only: %i[index show]
  resources :users, only: %i[index show]
  resources :relationships, only: %i[create destroy]
end
