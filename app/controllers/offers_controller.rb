class OffersController < ApplicationController
  before_action :find_offer, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      @offers = Offer.where("location_address ILIKE ?", "%#{params[:query]}%")
    else
      @offers = Offer.all
    end
    @markers = @offers.geocoded.map do |offer|
      {
        lat: offer.latitude,
        lng: offer.longitude,
        info_window: render_to_string(
          partial: "info_window",
          locals: { offer: offer }
        ),
        image_url: helpers.asset_url('marker-snail-classic.jpg')
      }
    end
  end

  def show
    @booking = Booking.new
    @markers = [{
      lat: @offer.latitude,
      lng: @offer.longitude,
      info_window: render_to_string(
        partial: "info_window",
        locals: { offer: @offer }
      ),
      image_url: helpers.asset_url('marker-snail-classic.jpg')
    }]
  end

  def my_offers
    @offers = Offer.where(user: current_user)
    authorize @offers
  end

  def new
    @offer = Offer.new
    authorize @offer
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.user = current_user
    authorize @offer
    if @offer.save
      redirect_to offers_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @offer.update(offer_params)
      redirect_to @offer
    else
      render :show
    end
  end

  def destroy
    @offer.destroy
    redirect_to offers_path
  end

  private

  def find_offer
    @offer = Offer.find(params[:id])
    authorize @offer
  end

  def offer_params
    params.require(:offer).permit(:price_per_day, :capacity, :shell_type,
                                  :start_available_time, :end_available_time,
                                  :location_address, :description, :offer_title,
                                  photos: [])
  end
end
