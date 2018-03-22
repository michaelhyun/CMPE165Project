Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index', as:'home'

  get 'about' => 'pages#about', as: 'about'
  get 'reservation' => 'reservations#index', as: 'reservation'
  get 'signup' => 'pages#signup', as: 'signup'
end
