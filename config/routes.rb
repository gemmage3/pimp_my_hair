Rails.application.routes.draw do

  devise_for :users
  root to: 'hairs#index'


  resources :hairs do
    resources :purchases, only: [ :create]
    collection do
      get 'my_hair'
    end
   end

  resources :users do
    resources :purchases, only: [ :index ]
  end

  resources :purchases, only: [ :show ]

end
