class VenuesController < ApplicationController    
  def show
    @venue = Venue.find_by(slug: params[:slug])
    @images = @venue.images
  end
end
