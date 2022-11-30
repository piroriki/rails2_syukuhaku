Rails.application.routes.draw do

  devise_for :members, :controllers => {
   :registrations => 'members/registrations',
   :sessions => 'members/sessions'
  }

  devise_scope :member do
   get '/members/sign_out' => 'members/sessions#destroy'
   post '/members/sign_out' => 'members/sessions#destroy'
  end

# account/profileページ関連のみに絞ってルーティング
  resources :members, only: [:show, :edit, :update]

# トップ画面専用
  resources :tops

   post '/rooms/:room_id/reservations/new' => 'reservations#create'

# rooms=親、reservation=子リソースでネストさせてルーティング

  resources :rooms do 
   resources :reservations
   collection do

    get 'post'

# 検索結果(エリア、キーワード)のルーティング追加
    get '/rooms/search' => 'rooms#search', as:'search'
    
   end
  end

 # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
