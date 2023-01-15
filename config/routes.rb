Rails.application.routes.draw do

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
    resources :hospitals, only: [:index, :show]
    resources :reservations, only: [:new, :show, :create, :index]
    resources :reviews, only: [:new, :show, :create, :index]
  end

  namespace :admin do
  resources :genres, only: [:index,:create,:edit,:update]
  resources:customers, only: [:index, :show, :edit, :update]
  resources :hospitals, only: [:index,:new,:create,:show,:edit,:update] # 商品一覧・・・等の記述
  resources :reservations, only: [:index, :show, :update]
  resources :reviews, only: [:index, :show, :edit, :update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end