class BookingsController < ApplicationController
    
    #need to change this to index
    def booknow        
        if params[:hotelname] == nil || params[:hotelid] == nil
            #redirect_to home_path
        else
            @cur_user = current_user
            @reservation_to_book = Reservation.where("reservations.hotelname = \'#{params[:hotelname]}\'").find(params[:hotelid])
        end
    end

    def bookhotel

    end

end
