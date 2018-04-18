class ChargesController < ApplicationController
    skip_before_action :authenticate_user!

    def new
    end

    # POST for submitting payment info
    # TODO: move to a new function hotel#book_hotel
    def create
        # TODO: change hard-coded price to price of specific hotel room
        @amount=500

        begin
            # for now, creates a new customer and (transparently) unique customer id per transaction
            # TODO: store customer id in User model (this associates user with payment credentials stored by stripe)
            customer = Stripe::Customer.create(
                :email => params[:stripeEmail],
                :source  => params[:stripeToken]
            )

            # creates one-time charge for hotel booking
            charge = Stripe::Charge.create(
                :customer    => customer.id,
                :amount      => @amount,
                :description => 'Rails Stripe customer',
                :currency    => 'usd'
            )
            redirect_to booking_complete_path

        rescue Stripe::CardError => e
            flash[:error] = e.message
            redirect_to hotel_booking_path
        end
    end
