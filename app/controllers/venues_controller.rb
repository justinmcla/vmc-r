class VenuesController < ApplicationController
    layout 'admin'
    def new
        @venue = Venue.new
        @venue.addresses.build
    end

    def create
        @venue = current_user.venues.build(post_params)
        puts post_params
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
    end

    def destroy
    end

    private

    def post_params
        params.require(:venue).permit(:name, :configuration, :seats, :greenrooms, :dressing_rooms, 
                                        addresses_attributes: [:address_1, :address_2, :city, :state, :zip])
    end
end
