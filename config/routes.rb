Rails.application.routes.draw do
  devise_for :users
  root to: "animes#index"

  resources :lists, only: [:new, :create, :edit, :update, :destroy] do
    resources :animes, only: [:index, :new, :create] do
      collection {get :search}
    end
  end

  resources :follows, only: [:new, :create]

end
