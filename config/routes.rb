Rails.application.routes.draw do
  root "posts#index"
  get "post/index", to: "post#index"
  resources :posts
  devise_for :users
end