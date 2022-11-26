Rails.application.routes.draw do

  get 'profiles/show'
  resource :profile, only: %i[show edit update] 

  devise_for :members, :controllers => {
   :registrations => 'members/registrations',
   :sessions => 'members/sessions'
  }

  devise_scope :member do
   get '/members/sign_out' => 'members/sessions#destroy'
   post '/members/sign_out' => 'members/sessions#destroy'
   get '/members/account' => 'members/registrations#account'
   # patch '/members/account' => 'members/registrations#account'
  end


  resources :tops

   post '/rooms/:room_id/reservations/new' => 'reservations#create'

  resources :rooms do
   resources :reservations
   collection do
    get 'post'
   end
  end

  get 'search' => 'searches#search'

 # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
