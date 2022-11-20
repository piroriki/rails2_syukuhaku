Rails.application.routes.draw do

  devise_for :members, :controllers => {
   :registrations => 'members/registrations',
   :sessions => 'members/sessions'
  }

  devise_scope :member do
   post '/members/sign_out' => 'members/sessions#destroy'
   get '/members/account' => 'members/registrations#account'
   # patch '/members/account' => 'members/registrations#account'
  end


  resources :tops, :reservations

  resources :rooms do
   collection do
    get 'search'
    get 'post'
   end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
