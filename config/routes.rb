Rails.application.routes.draw do
  devise_for :users,controllers: {
   registrations: 'users/registrations',
   sessions: 'users/sessions'
}

  devise_scope :user do
   get 'users/sign_up',to: 'users/registrations#new'
   get 'users/sign_in',to: 'users/sessions#new' 
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
