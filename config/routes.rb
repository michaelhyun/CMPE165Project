Rails.application.routes.draw do
   devise_scope :user do
    get "/sign_in" => "devise/sessions#new" # custom path to login/sign_in
    get "/sign_up" => "devise/registrations#new", as: "new_user_registration" # custom path to sign_up/registration
  end
  
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index', as:'home'

  get 'about' => 'pages#about', as: 'about'

  get 'reservation' => 'reservations#index', as: 'reservation'
  
  get '/search_reservation' => 'reservations#search', as: 'reservation_search'

  # Param is the :id of the reservation 
  get 'booknow/:hotelid' => 'bookings#booknow', as: 'booknow'
  
  # Show the bookings that belongs to the current user.
  get 'mybooking' => 'bookings#mybooking', as: 'mybooking'

  post 'booknow/bookhotel' => 'bookings#bookhotel', as: 'bookhotel'

  get 'booking' => 'bookings#index', as: 'booking'
  get 'signup' => 'pages#signup', as: 'signup'
end
