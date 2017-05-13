Rails.application.routes.draw do
  # resources :collaborators
  root 'welcome#index'
  
  
  resources :wikis do
  resources :collaborators, only: [:new, :create, :destroy]
  end
  
  resources :charges, only: [:new, :create, :destroy]
  devise_for :users
  resources :search
end