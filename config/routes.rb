# frozen_string_literal: true

Rails.application.routes.draw do
  resources :mushrooms, only: [:index]
  root to: 'mushrooms#index'
end
