Rails.application.routes.draw do
  root "post#index"
  resources :post
  devise_for :users
end