Rails.application.routes.draw do
  get '/login', to: 'sessions#new'

  namespace :admin do
    resources :users
  end

  root 'home#new'
  resources :cards
end
