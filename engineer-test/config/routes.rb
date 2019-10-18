Rails.application.routes.draw do
  root to: 'tweets#index'
  resources :tweets, only: %i[index create destroy]
  resources :tags, only: %i[index show]
end
