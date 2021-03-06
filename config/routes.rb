# frozen_string_literal: true

Rails.application.routes.draw do
  # get "users#show"
  devise_for :users
  root to: 'events#index'

  resources :events
  resources :users, only: [:show]
  resources :event_attendees
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
