Rails.application.routes.draw do
  get 'books/new'
  get 'users/show'
  devise_for :users
  root to: "homes#top"
  resources :books
  resources :users,only: [:show, :edit, :update, :index]
end
