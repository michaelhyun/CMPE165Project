Rails.application.routes.draw do
   devise_scope :user do
    get "/sign_in" => "devise/sessions#new" # custom path to login/sign_in
    get "/sign_up" => "devise/registrations#new", as: "new_user_registration" # custom path to sign_up/registration
  end
  
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index', as:'home'

  get 'about' => 'pages#about', as: 'about'
  get 'reservation' => 'pages#reservation', as: 'reservation'
  # get 'signup' => 'pages#signup', as: 'signup'
  # get 'signup', to: 'devise/registrations#new'

end
