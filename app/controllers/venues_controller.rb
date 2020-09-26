class VenuesController < ApplicationController
    layout 'admin'
    before_action :set_venue, only: [:edit, :update, :destroy]

    def new
        @venue = Venue.new
        @venue.build_address
    end

    def create
        @venue = current_user.venues.build(post_params)
        if @venue.save
            current_user.venues << @venue
            redirect_to home_path
        else
            redirect_to new_venue_path
        end
    end

    def edit
    end

    def update
        @venue.assign_attributes(post_params)
        if @venue.save
            redirect_to home_path
        else
            redirect_to edit_venue_path
        end
    end

    def destroy
        @venue.destroy
        redirect_to home_path
    end

    private

    def set_venue
        @venue = Venue.find_by_id(params[:id])
    end

    def post_params
        params.require(:venue).permit(:name, :configuration, :seats, :greenrooms, :dressing_rooms, 
                                        address_attributes: [:id, :address_1, :address_2, :city, :state, :zip])
    end
end
