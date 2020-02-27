Rails.application.routes.draw do
  get 'purchases/index'
  get 'purchases/create'
  get 'purchases/new'
  get 'purchases/show'
  devise_for :users
  root to: 'pages#home'

  resources :purchases, only: [ :show, :index, :new, :create ]
  resources :hairs do
    collection do
      get 'my_hairs'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
