class Admin::VenuesController < Admin::AdminController
  before_action :set_venue, only: [:show, :edit, :update, :destroy]

  def new
    @venue = Venue.new
    @venue.build_address
  end

  def create
    @venue = current_user.venues.build(post_params)
    resource_save(@venue, admin_path, new_admin_venue_path)
  end

  def show
  end

  def edit
  end

  def update
    @venue.assign_attributes(update_params)
    params[:venue][:images].each { |image| @venue.images.attach(image) } if params[:venue][:images]
    resource_save(@venue, admin_path, edit_admin_venue_path(@venue))
  end

  def destroy
    @venue.destroy
    redirect_to admin_path
  end

  private

  def set_venue
    @venue = current_user.venues.find_by(slug: params[:slug])
    redirect_to admin_venues_path unless @venue
  end

  def post_params
    params.require(:venue).permit(
      :name, 
      :configuration, 
      :seats, 
      :greenrooms, 
      :dressing_rooms, 
      images: [],
      address_attributes: [
        :id, 
        :address_1, 
        :address_2, 
        :city, 
        :state, 
        :zip ])
  end

  def update_params
    params.require(:venue).permit(
      :name,
      :configuration,
      :seats,
      :greenrooms,
      :dressing_rooms,
      address_attributes: [
        :id,
        :address_1,
        :address_2,
        :city,
        :state,
        :zip ])
  end
end