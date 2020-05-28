Rails.application.routes.draw do
  resources :cases
  resources :charities
  get 'home/index'
  root 'home#index'

end
