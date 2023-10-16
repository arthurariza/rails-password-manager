# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  authenticate :user do
    root 'passwords#index'

    resources :passwords do
      resources :shares, only: %i[new create destroy]
    end
  end

  get 'up' => 'rails/health#show', as: :rails_health_check
end
