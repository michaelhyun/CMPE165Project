Rails.application.routes.draw do

devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root 'home#index'

get '/' => 'home#index'
get 'hotel_listing' => 'hotel#hotel_list'
get 'hotel' => 'hotel#hotel_detail'
<<<<<<< HEAD
get 'hotel_booking' => 'hotel#hotel_booking'
get 'booking_complete' => 'hotel#booking_complete'

get 'my_booking'=>'account#mybooking'
get 'my_reservation'=>'account#myreservation'

=======

get 'hotel_booking' => 'hotel#hotel_booking'        # payment page
post 'hotel_booking' => 'hotel#book_hotel'          # submitting payment info
get 'booking_complete' => 'hotel#booking_complete'  # confirmation page
>>>>>>> 1f3f61c11e7e98fc3b3ed4700983486867f994d7

get 'aboutus' => 'admin#about_us'
get 'contactus' => 'admin#contact_us'
get 'services' => 'admin#services'
end
