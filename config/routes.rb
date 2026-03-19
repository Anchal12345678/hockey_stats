Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'

  resources :teams, only: [:index, :show]
  resources :players, only: [:index, :show]
  resources :stats, only: [:index]
end