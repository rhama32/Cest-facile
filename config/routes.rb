Rails.application.routes.draw do
  
  #GoogleMapの使用
    get 'maps/index'
    resources :maps, only: [:index]

  #医者用
  # URL /doctors/sign_in ...
  devise_for :doctors,skip:[:passwords], controllers: {
  registrations: "doctor/registrations",
  sessions: 'doctor/sessions'
}

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  #トップページ、アバウトページの遷移
  root to: 'public/homes#top'
  get '/about' => 'public/homes#about'

  #管理者トップページ
  get '/admin' => 'admin/homes#top'

  #検索機能の追加
  get "search" => "searches#search"
  get "hospital_search" => "searches#hospital_search"

  # 顧客のマイページ、編集画面、退会画面
  scope module: :public do
    get 'customers/mypage' => 'customers#show', as: 'customers_mypage'
    get 'customers/information/edit' => 'customers#edit', as: 'customers_edit'
    get 'unsubscribe' => 'customers#unsubscribe', as: 'customers_unsubscribe'
    patch 'customers/information' => 'customers#update', as: 'customers_update'
    patch 'withdraw' => 'customers#withdraw', as: 'customers_withdraw'
  end

  devise_scope :customer do
  #ゲストログインのルーティング
    post 'customers/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  #会員側 病院検索/予約/レビュー投稿
  namespace :public do
    resource :follows, only: [:index, :show, :create, :destroy]
    get 'followings' => 'follows#followings', as: 'followings'
    get 'followers' => 'follows#followers', as: 'followers'
    resources :hospitals, only: [:create, :index, :show] do
     resources :hospital_doctors, only: [:index, :show]
     resources :reviews, only: [:new, :edit, :update, :destroy]
     get 'hospital_reviews' => 'reviews#hospital_reviews'
    end
    resources :reservations, only: [:new, :show, :create, :index, :update, :destroy] do
      get 'confirm', to: 'reservations#confirm'
    end
    
    resources :symptoms, only: [:index]
    resources :reviews, only: [:index, :show, :edit, :create, :destroy] do
     resource :favorites, only: [:create, :destroy]
     resources :replies, only: [:create]
    end

  end

  namespace :admin do
  resources :genres, only: [:index,:create,:edit,:update, :destroy]
  resources:customers, only: [:index, :show, :edit, :update]
  resources :hospitals, only: [:index,:create, :new,  :show, :edit, :update, :destroy]
  resources :reservations, only: [:index, :show, :update, :destroy]
  resources :reviews, only: [:index, :show, :update, :destroy]
  resources :doctors, only: [:index, :show, :edit, :update, :destroy]
  resources :symptoms, only: [:index, :create, :edit, :update]
  resources :notifications, only: [:index]
  end

  namespace :doctor do
   resource :followers, only: [:index]
    get 'followers' => 'followers#index', as: 'followers'
    
    get "/hospital_doctors/unsubscribe" => "hospital_doctors#unsubscribe", as: "unsubsubscribe"
    patch "/hospital_doctors/withdraw" => "hospital_doctors#withdraw", as: "withdraw"
   resources :hospital_doctors, only: [:show, :edit, :update]
   resources :reservations, only: [:index, :show, :update]
   resources :reviews, only: [:index] do
     resources :replies, only: [:create, :confirm, :index]
 end
   resources :notifications, only: [:index]

  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end