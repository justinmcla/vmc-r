class VenuesController < ApplicationController    
    def show
        @venue = Venue.find_by(slug: params[:slug])
    end
end
