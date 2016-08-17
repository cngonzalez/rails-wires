Rails.application.routes.draw do
  resources :likes
  resources :pages
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "application#index"

  get '/test', to: 'application#test'
end
