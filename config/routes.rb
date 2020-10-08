Rails.application.routes.draw do
  devise_for :users
  get 'animes/index'
  root to: "animes#index"
end
