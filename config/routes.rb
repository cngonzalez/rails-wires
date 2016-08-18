Rails.application.routes.draw do
  resources :likes
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :pages 
  resources :users do
    resources :pages, only: [:new, :create, :edit, :delete]
  end

  root to: "application#index"

  get '/test', to: 'application#test'
end
