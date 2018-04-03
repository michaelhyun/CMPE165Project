class BookingsController < ApplicationController
    
    #need to change this to index
    def booknow        
        if params[:hotelname] == nil || params[:hotelid] == nil
            #redirect_to home_path
        else
            @cur_user = current_user
            @reservation_to_book = Reservation.where("reservations.hotelname like ?", "#{params[:hotelname]}".strip()).find(params[:hotelid])
        end
    end

    #Shows all bookings that belongs to the current user.
    def mybooking
        @userid_string = "#{params[:user]}".strip()
        @booked_reservation = Reservation.where("reservations.reservedbyuserid like ?", @userid_string);
        
    end

    #This method is called when the User clicks on the "Book Now" button in the reservation listing.
    def bookhotel        
        @hotelname = "#{params[:hotelname]}".strip()
        @hotelname = "%#{@hotelname}%"
        @reservation = Reservation.where("reservations.hotelname like ?", @hotelname).find(params[:hotel_id])

        if @reservation.isreserved
            @reservation.update(isreserved: false, confirmationcode: 'Not reserved.', reservedbyuserid: '')
        else
            @reservation.update(isreserved: true, confirmationcode: 'Reserved!', reservedbyuserid: "#{params[:userid]}".strip())
        end

        @reservation.save       
        redirect_to action: "mybooking", user: params[:userid]
        
        #render inline: "<%= @reservation.confirmationcode %> <%= params %>"
    end
end
