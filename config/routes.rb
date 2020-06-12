Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  scope '/checkout' do
    post 'create' , to: 'checkout#create' , as: 'checkout_create'
    get 'cancel' , to: 'checkout#cancel' , as: 'checkout_cancel'
    get 'success' , to: 'checkout#success' , as: 'checkout_success'
  end

  get 'freecases' , to: 'cases#freeindex' , as: 'free_cases'
  get 'profile' , to: 'cases#profile', as: 'profile'
  post 'freecases/protect' , to: 'cases#freeprotect' , as: 'protect_case'
  post 'cases/cancel' , :to => 'cases#remove' , as:'donor_cancel'
  post 'cases/protect' , :to => 'cases#protect' , as: 'donor_protect'
  put 'cases/updatestate/:id', to: 'cases#updatestate'
  get 'search/:q' , to: 'cases#search' , as: 'search'



  resources :cases do
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
