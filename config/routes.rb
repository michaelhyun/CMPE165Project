Rails.application.routes.draw do

devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root 'home#index'

get '/' => 'home#index'
get 'hotel_listing' => 'hotel#hotel_list'
get 'hotel' => 'hotel#hotel_detail'
get 'hotel_booking' => 'hotel#hotel_booking'
get 'booking_complete' => 'hotel#booking_complete'

get 'my_booking'=>'account#mybooking'
get 'my_reservation'=>'account#myreservation'


get 'aboutus' => 'admin#about_us'
get 'contactus' => 'admin#contact_us'
get 'services' => 'admin#services'
end
