Rails.application.routes.draw do

  resources :wikis do
    resources :collaborators, only: [:index, :create, :destroy]
  end
  resources :charges, only: [:new, :create]

  devise_for :users
  resources :users, only: [:show]
  get 'welcome/index'

  get 'welcome/show'

  root 'welcome#index'

  get 'users/downgrade/:customer' => 'charges#downgrade_account', as: :downgrade_account
end
