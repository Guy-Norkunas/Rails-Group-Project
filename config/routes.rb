Rails.application.routes.draw do
  root "post#index"
  resources :post do
    resources :comments
  end
  devise_for :users

  get "/home", to: "post#index", as: "home_page"

  get "/profile/:id", to: "profile#show", as: "show_profile"
  get "/profile", to: "profile#index", as: "user_profile"

end