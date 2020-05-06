Rails.application.routes.draw do
  root "post#index"
  resources :posts
  devise_for :users
end