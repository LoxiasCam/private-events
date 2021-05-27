Rails.application.routes.draw do
  devise_for :users
  root "events#index"
  resources :users, only: [:show]
  resources :events, only: [:new, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
