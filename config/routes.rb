Rails.application.routes.draw do
  devise_for :users
  root to: 'hairs#home'

  resources :hairs do
    collection do
      get 'my_hair'
    end
  end

  resources :purchases, only: [ :show, :index, :new, :create ]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
