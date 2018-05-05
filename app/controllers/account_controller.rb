class AccountController < ApplicationController
  def mybooking
  end

  def myreservation
    @results = Booking.where(user_id: current_user.id)
  end
end
