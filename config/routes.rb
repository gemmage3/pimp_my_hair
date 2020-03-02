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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'infos/why_us', to: 'infos#why', as: :info_why
  get 'infos/experience', to: 'infos#experience', as: :info_experience
  get 'infos/faq', to: 'infos#faq', as: :info_faq
  get 'infos/affiliate_link', to: 'infos#affiliate', as: :info_affiliate
  get 'infos/shipping_prices', to: 'infos#shipping', as: :info_shipping
  get 'infos/help', to: 'infos#help', as: :info_help
end
