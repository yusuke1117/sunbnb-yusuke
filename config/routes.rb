Rails.application.routes.draw do
  root 'pages#home'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    omniauth_callbacks: 'users/omniauth_callbacks'

  }

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
