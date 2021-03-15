Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  resources :homes,only: [:top, :index]
  resources :books
  resources :users,only: [:show, :edit, :update, :index]
end
