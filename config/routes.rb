Rails.application.routes.draw do

  devise_for :members, :controllers => {
   :registrations => 'members/registrations',
   :sessions => 'members/sessions'
  }

  devise_scope :member do
   post '/members/sign_out' => 'members/sessions#destroy'
   get '/members/confirm' => 'members/registrations#confirm'
  end


  resources :tops, :reservations

  resources :rooms do
   member do
    get 'post'
   end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
