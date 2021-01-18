Rails.application.routes.draw do
  devise_for :users
  root to: 'prototypes#index'
  # resourcesを用いてnewアクションとcreateアクションに対するルーティングを記述
  # resourcesを用いてshowアクションに対するルーティングを記述
  # resourcesを用いてdestroyアクションに対するルーティングを記述
  resources :prototypes, except: :index do
    resources :comments, only: :create
  end
  # resourcesを用いてshowアクションに対するルーティングを記述
  resources :users, only: :show
end
