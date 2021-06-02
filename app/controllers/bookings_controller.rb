class BookingsController < ApplicationController
  before_action :find_offer, only: [:new, :create]

  def new
    # we need @offer in our `simple_form_for`
    # @offer = Offer.find(params[:offer_id])
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    # associate booking with corresponding offer
    # @offer = Offer.find(params[:offer_id])
    # associate booking with corresponding offer
    # @user = @offer.user
    @booking.offer = @offer
    @booking.user = current_user
    @snail = @offer.user
    authorize @booking
    if @booking.save
      redirect_to offer_path(@offer)
    else
      render :new
    end
  end

  private

  def find_offer
    @offer = Offer.find(params[:offer_id])
  end

  def booking_params
    params.require(:booking).permit(:arrival_date, :end_date)
  end
end
