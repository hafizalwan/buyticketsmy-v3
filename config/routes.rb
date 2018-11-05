Rails.application.routes.draw do
  root 'pages#home'
  devise_for :users

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

  get '/dashboard' => 'dashboards#index'
  get '/rental_cars' => 'carentals#index'

end
