# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  authenticate :user do
    root 'passwords#index'

    resources :passwords
  end

  get 'up' => 'rails/health#show', as: :rails_health_check
end
