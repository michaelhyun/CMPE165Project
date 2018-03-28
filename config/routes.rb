Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index', as:'home'

  get 'about' => 'pages#about', as: 'about'
  get 'reservation' => 'reservations#index', as: 'reservation'
  

  # Param is the :id of the reservation 
  get 'booknow/:id' => 'bookings#booknow', as: 'booknow'

  get 'booking' => 'bookings#index', as: 'booking'

  get 'signup' => 'pages#signup', as: 'signup'
end
