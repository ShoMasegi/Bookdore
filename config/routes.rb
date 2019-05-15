Rails.application.routes.draw do
  namespace :admin do
    resources :users
  end

  root 'home#new'
  resources :cards
end

