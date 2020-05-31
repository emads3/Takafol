Rails.application.routes.draw do
  resources :cases
  
  devise_for :donors  ,controllers: {
    sessions: 'donors/sessions'
  }

  devise_for :charities , controllers: {
    sessions: 'charities/sessions'
  }

  get 'home/index'
  root 'home#index'

end
