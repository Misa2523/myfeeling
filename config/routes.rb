Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  #管理者側のルーティング設定
  get 'admin', to: 'admin/homes#top'
  namespace :admin do
    resources :users, only: [:show, :edit, :update]
    resources :feeling_posts, only: [:index, :show, :destroy]
  end


  #ユーザー側のルーティング設定
  root 'public/homes#top'
  get 'about', to: 'public/homes#about'

  scope module: :public do
    resources :users, only: [:index, :show, :edit, :update] do
      collection do #オリジナルのアクションに対する設定
        get 'check' => "users#check" #退会確認ページのアクション
        patch 'out' => "users#out" #退会処理のアクション
        get 'search' => "users#search" #キーワード検索のアクション
      end

      #フォロー・フォロワーはユーザーと親子関係になる
      resource :relationships, only: [:create, :destroy] #resource単数形 → /:idがURLに含まれない（フォローなどのidはURLに含める必要がない）
        get "followers" => "relationships#followers", as: "followers" #フォロワー(フォローわれている人)の一覧を表示
        get "followings" => "relationships#followings", as: "followings" #フォローしている人の一覧を表示

    end

    resources :feeling_posts, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
      collection do
        get 'search'
      end

      #コメント、いいねは投稿に対し行われるため、親子関係になる
      resources :comments, only: [:create, :update, :destroy]
      resource :favorite, only: [:create, :destroy, :index] #resource単数形 → /:idがURLに含まれない（いいねのidはURLに含める必要がない）
    end

  end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
