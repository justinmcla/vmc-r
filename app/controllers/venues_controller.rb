class VenuesController < ApplicationController    
  before_action :set_venue, only: [:show, :update]

  def index
    @venues = venue_search.includes(:address)
  end

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
    redirect_to venue_path(@venue), notice: 'Message sent!'
  end

  private

  def set_venue
    @venue = Venue.find_by(slug: params[:slug])
    redirect_to venues_path unless @venue
  end

  def venue_search
  
    return Venue.all if params[:name] && params[:name].downcase == 'all'

    sql = <<~SQL
      name LIKE ? OR 
      city LIKE ? OR 
      state LIKE ? OR 
      zip LIKE ?
    SQL

    params.transform_values! do |value|
      "%#{value}%" unless value.blank?
    end

    Venue.joins(:address).where(
      sql, 
      "#{params[:name]}", 
      "#{params[:city]}", 
      "#{params[:state]}", 
      "#{params[:zip]}"
    )
end
end
