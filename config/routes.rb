Rails.application.routes.draw do

  resources :projects do
    put 'status'
  end

  resources :projects do
    resources :comments, :only => [:create]
  end

  resources :home, :only => [:index]

  root 'home#index'

  devise_for :users, :controllers => {
    :omniauth_callbacks => "users/omniauth_callbacks",
    :registrations => "users/registrations"
  }

end
