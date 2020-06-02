Rails.application.routes.draw do
  resources :cases do
    post '' , :to => 'cases#provide'
  end
  
  devise_for :donors , path: 'donors' ,controllers: {
    sessions: 'donors/sessions'
  }

  devise_for :charities ,path: 'charities', controllers: {
    sessions: 'charities/sessions'
  }


  get 'home/index'
  root 'home#index'

end
