# frozen_string_literal: true

Rails.application.routes.draw do
  # get "users#show"
  devise_for :users
  root 'events#index'

  resources :events
  resources :users
  resources :event_attendees
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
