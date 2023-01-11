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

  #会員側 病院検索
  resources :hospitals, only: [:index, :show]

  namespace :admin do
  resources :genres, only: [:index,:create,:edit,:update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
