Rails.application.routes.draw do
  devise_for :users

  # ホームページのルート
  root 'prototypes#index'

  # Prototypesコントローラーのルート
  resources :prototypes, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    # コメントのルートをネスト
    resources :comments, only: [:create]
  end

  # ユーザーのリソース
  resources :users, only: [:show, :index]
end
