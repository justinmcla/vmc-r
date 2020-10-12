class Admin::VenuesController < Admin::AdminController
  before_action :set_venue, only: [:show, :edit, :update, :destroy]

  def new
    @venue = Venue.new
    @venue.build_address
  end

  def create
    @venue = current_user.venues.build(post_params)
    @venue.save ? (redirect_to admin_path) : (render :new)
  end

  def show
  end

  def edit
  end

  def update
    @venue.assign_attributes(post_params)
    @venue.save ? (redirect_to admin_path) : (render :edit)
  end

  def destroy
    @venue.destroy
    redirect_to admin_path
  end

  private

  def set_venue
    @venue = current_user.venues.find_by(slug: params[:slug])
  end

  def post_params
    params.require(:venue).permit(:name, 
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
                                          :zip])
  end
end
