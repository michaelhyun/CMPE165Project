Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root 'home#index'

get '/' => 'home#index'
get 'hotel_listing' => 'hotel#hotel_list'
get 'hotel' => 'hotel#hotel_detail'
get 'hotel_booking' => 'hotel#hotel_booking'
get 'booking_complete' => 'hotel#booking_complete'
end
