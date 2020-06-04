Rails.application.routes.draw do
  put 'cases/updatestate/:id', to: 'cases#updatestate'
  resources :cases do
    post '' , :to => 'cases#provide'
    post '' , :to => 'cases#remove'
    # put '' , :to => 'cases#updatestate'
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
