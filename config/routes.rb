Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  resources :jobs, only:[:index,:show,:new,:create]
  resources :users, only:[:show]
  resources :rooms, only:[:create, :show]
  resources :messages, only:[:create]
end
