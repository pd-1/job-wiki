Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    post 'user/guest_sign_in', to: 'users/sessions#guest_sign_in'
    get '/search', to: 'users/registrations#search',defaults: { format: 'json' }
  end
  
  resources :jobs
  resources :users, only:[:show,:edit,:update]
  resources :rooms, only:[:create, :show,:index]
  resources :messages, only:[:create,:destroy]
  post '/home/guest_sign_in', to: 'home#guest_sign_in'
end
