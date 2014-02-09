TreasureBox::Application.routes.draw do

  root to: "welcome#index"

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  resources :treasures
end
