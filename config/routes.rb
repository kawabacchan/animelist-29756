Rails.application.routes.draw do
  devise_for :users
  get 'animes/index'
  root to: "animes#index"

  resources :lists, only: [:new, :create]
end
