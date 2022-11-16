Rails.application.routes.draw do

  resources :tops, :reservations

  resources :rooms do
   member do
    get 'post'
   end
  end

  devise_for :users, :controllers => {
   :registrations => 'users/registrations',
   :sessions => 'users/sessions'
  }

  devise_scope :users do
   get "users/sign_up"  => "users/registrations#new"
   get "users/sign_in" => "users/sessions#new"
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
