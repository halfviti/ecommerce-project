# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :customers
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :products, only: %i[index show]

  get '/checkout' => 'checkout#index', :as => :checkout
  get '/checkout/confirmation' => 'checkout#confirmation', :as => :confirmation

  resources :cart, only: [:index] do
    collection do
      post :add_product
      get :clear
      post :remove_product
      post :update_quantity
    end
  end

  resources :categories, only: [:show]

  get 'search', to: 'pages#search'

  get ':permalink', to: 'pages#permalink'
  root to: 'pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
