Rails.application.routes.draw do
  root "post#index"
  resource :post

  devise_for :users
end
