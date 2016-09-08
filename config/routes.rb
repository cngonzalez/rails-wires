Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  get '/pages/all', to: 'pages#all'
  get '/pages/test', to: 'pages#test'
  resources :pages do
    resources :likes
  end
  resources :users

  root to: "application#index"


end
