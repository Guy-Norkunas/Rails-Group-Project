Rails.application.routes.draw do
  root "post#index"
  resources :post
  devise_for :users

  get "/profile/:id", to: "profile#show", as: "show_profile"
  get "/profile", to: "profile#index", as: "user_profile"

end