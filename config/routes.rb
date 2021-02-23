# frozen_string_literal: true

Rails.application.routes.draw do
  root 'rooms#index'
  resources :rooms, expect: [:index]
end
