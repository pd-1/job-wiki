Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get '/search', to: 'users/registrations#search',defaults: { format: 'json' }
    post '/home/guest1_sign_in', to: 'home#new_guest1'
    post '/home/guest2_sign_in', to: 'home#new_guest2'
  end
  
  resources :jobs
  resources :users, only:[:show,:edit,:update]
  resources :rooms, only:[:create, :show,:index]
  resources :messages, only:[:create,:destroy]
end
