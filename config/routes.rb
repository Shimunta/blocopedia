Rails.application.routes.draw do

  resources :wikis
  resources :charges, only: [:new, :create]
  devise_for :users
  resources :users, only: [:show]
  get 'welcome/index'

  get 'welcome/show'

  root 'welcome#index'
end
