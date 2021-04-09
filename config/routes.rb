Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'signup', to: 'devise/registrations#new', as: :get_category_childrennew_user_registration 
  end
  root to: 'home#index'
  resources :jobs
  resources :users, only:[:show,:edit,:update]
  resources :rooms, only:[:create, :show,:index]
  resources :messages, only:[:create,:destroy]
end

# collection do
  # get 'get_category_children', defaults: { format: 'json' }