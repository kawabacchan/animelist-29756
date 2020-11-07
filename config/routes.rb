Rails.application.routes.draw do
  devise_for :users
  root to: "animes#index"

  resources :lists, only: [:new, :create, :edit, :update, :destroy] do
    collection {get :search}
    resources :animes do
      collection {get :search}
    end
  end

  resources :follows, only: [:new, :create]

end
