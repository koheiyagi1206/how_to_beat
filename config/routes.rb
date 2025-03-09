Rails.application.routes.draw do

  # root path
  root to: "standard/homes#top"

  # about page
  get "/about", to: "standard/homes#about", as: "about"

  # 管理者設定
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  namespace :admin do
    resources :users,     only:[:index, :show, :edit, :update, :destroy]
    resources :posts,     only:[:show, :destroy]
    resources :comments,  only:[:show, :destroy]
    resources :tags,      only:[:index, :destroy]
  end
  get "/admin", to: "admin/homes#top"

  # ユーザー設定
  devise_for :users, controllers: {
    registrations:  "standard/registrations",
    sessions:       "standard/sessions"
  }
  resources :users, controller: "standard/users", only:[:show, :edit, :update, :destroy]
  resources :posts, controller: "standard/posts" do
    resources :post_bodies, controller: "standard/post_bodies", only:[:create, :update, :destroy]
    resources :comments,    controller: "standard/comments",    only:[:create, :update, :destroy]
  end
  resources :groups,  controller: "standard/groups"
  resources :tags,    controller: "standard/tags", only:[:index, :update, :destroy]
  get "/mypage", to: "standard/users#mypage"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
