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
      get 'photo'
      get 'amenity'
      get 'location'
    end
    resources :photos, only: [:create, :destroy]
  end


  resources :users, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
