Rails.application.routes.draw do

  # 管理者用設定
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  devise_for :users, controllers: {
    registrations:  "standard/registrations",
    sessions:       "standard/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
