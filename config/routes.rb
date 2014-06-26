Rails.application.routes.draw do
  resources :projects

  root 'projects#index'

  devise_for :users
end
