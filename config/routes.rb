Rails.application.routes.draw do
  get 'animes/index'
  root to: "animes#index"
end
