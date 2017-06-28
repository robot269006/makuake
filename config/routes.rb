Rails.application.routes.draw do
  devise_for :users
  # Select from:  index, show, new, edit, create, update, destroy
  # devise_for :users
  # root 'projects#index'
  # resources :projects
  # resources :products, except: [:show]
  # resources :users
end
