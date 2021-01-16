Rails.application.routes.draw do
  devise_for :users
  root to: 'prototypes#index'
  # resourcesを用いてnewアクションとcreateアクションに対するルーティングを記述
  resources :prototypes, only: [:new, :create] do
  end
end
