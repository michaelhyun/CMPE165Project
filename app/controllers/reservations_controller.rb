class ReservationsController < ApplicationController
  def new

  end

  def show
      
  end

  def index
    @reservations = Reservation.all
  end
  
  def search
    @hotelname = "%#{params[:hotelname]}%"
    @city = "%#{params[:city]}%"
    @state = "%#{params[:state]}"
    #todo add city and state to reservation so that it can be query.
    @found_hotels = Reservation.where('hotelname LIKE ?', @hotelname)
  end
  

end