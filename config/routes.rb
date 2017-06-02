Rails.application.routes.draw do
  devise_for :models
  # resources :collaborators
  root 'welcome#index'
  
  
  resources :wikis do
  resources :collaborators, only: [:new, :create, :destroy]
  end
  
  resources :charges, only: [:new, :create, :destroy]
  devise_for :users
  resources :search
end