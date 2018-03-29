class ReservationsController < ApplicationController
  def new

  end

  def show
      
  end

  def index
      @reservations = Reservation.all
  end
  
  def search
  end
  
end