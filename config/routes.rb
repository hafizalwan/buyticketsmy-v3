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
end
