Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :pages do
    resources :likes
  end
  resources :users
  
  root to: "application#index"

end
