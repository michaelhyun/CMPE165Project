class BookingsController < ApplicationController
    def booknow        
        @cur_user = current_user
        @reservation_to_book = Reservation.where("reservations.hotelname = \'#{params[:hotelname]}\'").find(params[:hotelid])
    end

end
