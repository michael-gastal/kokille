class OffersController < ApplicationController

    def index
        @offers = Offer.all
    end

    def show
        find_offer
    end

    def new
        @offer = Offer.new
    end

    def create
        @offer = Offer.new(offer_params)
        @offer.user = current_user
        if @offer.save
            redirect_to offers_path
        else
            render :new
        end
    end

    def edit
        find_offer
    end 

    def update
        find_offer
        if @offer.update(offer_params)
            redirect_to @offer
        else
            render :show
        end
    end

    def destroy
        find_offer
        @offer.destroy
        redirect_to offers_path
    end

    private

    def find_offer
        @offer = Offer.find(params[:id])
    end

    def offer_params
        params.require(:offer).permit(:price_per_day, :capacity, :shell_type, 
                                    :start_available_time, :end_available_time, 
                                    :location_address, :description, :offer_title)
    end
end
