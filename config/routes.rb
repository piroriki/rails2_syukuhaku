Rails.application.routes.draw do

  resources :tops, :reservations

  resources :rooms do
   member do
    get 'post'
   end
  end

  devise_for :users

  devise_scope :user do
   get 'users/sign_up',to: 'users/registrations#new'
   post 'users/sign-up',to: 'users/registrations#create'
   get 'users/sign_in',to: 'users/sessions#new' 
   post 'users/sign-in',to: 'users/sessions#create'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
