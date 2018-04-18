Rails.application.routes.draw do
# route to charges controller
resources :charges, only: [:new, :create]
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root 'home#index'

get '/' => 'home#index'
get 'hotel_listing' => 'hotel#hotel_list'
get 'hotel' => 'hotel#hotel_detail'

#get 'hotel_booking' => 'hotel#hotel_booking'        # payment page
#post 'hotel_booking' => 'hotel#book_hotel'          # submitting payment info
# temporary
get 'hotel_booking' => 'charges#new'                # payment page
post 'hotel_booking' => 'charges#create'            # submitting payment info

get 'booking_complete' => 'hotel#booking_complete'  # confirmation page

get 'aboutus' => 'admin#about_us'
get 'contactus' => 'admin#contact_us'
get 'services' => 'admin#services'
end
