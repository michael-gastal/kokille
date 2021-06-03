Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  resources :offers do
    resources :bookings, only: [ :new, :create ]
    collection do
      get :my_offers
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
