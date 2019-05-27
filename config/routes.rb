Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  namespace :admin do
    resources :users
  end

  root 'home#new'
  resources :books, except: [:destroy]
  resources :cards do
    resources :books, only: [:index, :show]
  end
end
