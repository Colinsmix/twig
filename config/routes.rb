Rails.application.routes.draw do
  resources :projects

  root 'projects#index'

  devise_for :users, :controllers => {
    :omniauth_callbacks => "users/omniauth_callbacks",
    :registrations => "users/registrations"
  }

end
