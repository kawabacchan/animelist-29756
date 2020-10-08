Rails.application.routes.draw do
  devise_for :users
  root to: "animes#index"

  resources :lists, only: [:new, :create] do
    resources :animes, only: [:index, :new, :create]
  end

end
