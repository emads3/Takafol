Rails.application.routes.draw do
  
  put 'cases/updatestate/:id', to: 'cases#updatestate'

  scope '/checkout' do
    post 'create' , to: 'checkout#create' , as: 'checkout_create'
    get 'cancel' , to: 'checkout#cancel' , as: 'checkout_cancel'
    get 'success' , to: 'checkout#success' , as: 'checkout_success'

  end

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
