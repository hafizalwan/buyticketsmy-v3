Rails.application.routes.draw do
  root 'pages#home'
  devise_for :users, path: '', path_names: {sign_in: 'login', sign_out: 'logout', edit: 'profile', sign_up: 'registration', },
  controllers: {omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations'}

  resources :activities, except: [:edit] do
    member do
      get 'description'
      get 'photos'
      get 'location'
      get 'price'
    end
    resources :reservations, only: [:create]
  end

  get '/reservation_success' => 'reservations#success'
  get '/your_activities' => 'reservations#your_activities'
  get '/your_reservations' => 'reservations#your_reservations'

  resources :reservations, only: [:approve, :decline] do
    member do
      post '/approve' => 'reservations#approve'
      post '/decline' => 'reservations#decline'
    end
  end

  resources :revenues, only: [:index]

  get '/dashboard' => 'dashboards#index'
  get '/rental_cars' => 'carentals#index'
  get '/packages' => 'packages#index'

end
