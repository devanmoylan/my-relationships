# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users do
    resources :events
    resources :people do
      resources :bonds
      resources :experiences
      resources :interactions
      resources :interests

      collection do
        post :import
      end
    end
  end

  resources :mentions, only: [:index]
end
