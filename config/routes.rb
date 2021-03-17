Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  resources :jobs, only:[:index,:show,:new,:create]
  resources :messages, only:[:index]
  resources :users, only:[:show]
  
end
