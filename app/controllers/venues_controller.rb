class VenuesController < ApplicationController    
  before_action :set_venue

  def show
    @images = @venue.images
  end

  def update
    @sender = {
      name: params[:name],
      email: params[:email],
      message: params[:message]
    }
    @admin = @venue.user
    VenueMailer.with(sender: @sender, admin: @admin, venue: @venue).booking_query.deliver_now
    redirect_to venue_path(@venue)
  end

  private

  def set_venue
    @venue = Venue.find_by(slug: params[:slug])
  end
end
