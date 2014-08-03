Rails.application.routes.draw do

  resources :projects do
    put 'status'
  end

  resources :projects do
    resources :comments, only: [:create]
  end

  root 'projects#index'

  devise_for :users, :controllers => {
    :omniauth_callbacks => "users/omniauth_callbacks",
    :registrations => "users/registrations"
  }

end
