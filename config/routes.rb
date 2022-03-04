Rails.application.routes.draw do
  devise_for :users
  get 'messages/index'
  resources :users 
  root to: "messages#index"
end
