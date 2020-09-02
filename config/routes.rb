Rails.application.routes.draw do
  root 'pages#home'

  devise_for :users,
    path: '',
    path_names: {sign_in: 'login', sign_out: 'logout', edit: 'profile', sign_up: 'registration'},
    controllers: {omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations'}

  resources :rooms do 
    member do
      get 'listing'
      get 'price'
      get 'description'
      get 'photo_upload'
      get 'amenity'
      get 'location'
      get 'preload'
      get 'preview'
    end
    resources :photos, only: [:create, :destroy]
    resources :reservations, only: [:create]
  end

  get '/reservations', to: "reservations#your_reservations"
  get '/trips', to:"reservations#your_trips"

  resources :users, only: [:show]

  resources :guest_reviews, only: [:create, :destroy]
  resources :host_reviews, only: [:create, :destroy]

  get 'search' => 'pages#search'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
