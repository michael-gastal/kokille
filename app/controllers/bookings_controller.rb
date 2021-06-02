class BookingsController < ApplicationController

  def new
    # we need @restaurant in our `simple_form_for`
    @offer = ROffer.find(params[:offer_id])
    @booking = Booking.new
  end
end
