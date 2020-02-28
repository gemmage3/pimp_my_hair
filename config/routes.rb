Rails.application.routes.draw do
  devise_for :users
  root to: 'hairs#index'

  # devise_scope :user do
    # get '/users/sign_out' => 'devise/#destroy'

    resources :hairs do
      collection do
        get 'my_hair'
      end
    end
  # end

  resources :purchases, only: [ :show, :index, :new, :create ]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
