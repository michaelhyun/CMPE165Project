class BookingsController < ApplicationController

    def booknow
        @reservation_to_book = Reservation.find(params[:id])
    end

end
