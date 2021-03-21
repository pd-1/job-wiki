Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  resources :jobs
  resources :users, only:[:show]
  resources :rooms, only:[:create, :show]
  resources :messages, only:[:create,:destroy]
end
