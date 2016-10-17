Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  get '/pages/all', to: 'pages#all'
  get '/pages/test', to: 'pages#test'
  get 'pages/:id/page_html', to: 'pages#page_html'

  resources :pages do
    resources :likes
    resources :elements, only: [:update]
  end

  resources :users

  root to: "application#index"


end
