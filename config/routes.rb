Rails.application.routes.draw do
  devise_for :users
  root to: 'prototypes#index'
  # resourcesを用いてnewアクションとcreateアクションに対するルーティングを記述
  # resourcesを用いてshowアクションに対するルーティングを記述
  resources :prototypes, only: [:new, :create, :show, :edit, :update] do
  end
end
