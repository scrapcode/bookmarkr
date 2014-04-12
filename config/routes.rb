Rails.application.routes.draw do
  # ROOT
  root 'static_pages#home'
  
  # User Management
  resources :users
  resources :sessions,       only: [:new, :create, :destroy]
  match '/signup', to: 'users#new', via: 'get'
  match '/signin', to: 'sessions#new', via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'
end
