Rails.application.routes.draw do
  root 'home#new'
  resources :cards
end

