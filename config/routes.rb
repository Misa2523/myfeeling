Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  #ユーザー側のルーティング設定
  namespace :public do
    get 'relationships/create'
    get 'relationships/destroy'

    get 'favorites/create'
    get 'favorites/destroy'
    get 'favorites/index'

    get 'commentes/create'
    get 'commentes/update'
    get 'commentes/destroy'

    get 'feeling_posts/new'
    get 'feeling_posts/create'
    get 'feeling_posts/index'
    get 'feeling_posts/show'
    get 'feeling_posts/edit'
    get 'feeling_posts/update'
    get 'feeling_posts/destroy'
    get 'feeling_posts/search'

    get 'users/index'
    get 'users/show'
    get 'users/edit'
    get 'users/update'
    get 'users/search'
    get 'users/check'
    get 'users/out'

    get 'homes/top'
    get 'homes/about'
  end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
