class Admin::InventoriesController < Admin::AdminController
  before_action :set_venue
  skip_before_action :set_venue, only: [:index]
  before_action :set_inventory, only: [:show, :edit, :update, :destroy]

  def new
    @inventory = @venue.inventories.build
  end

  def create
    @inventory = @venue.inventories.build(post_params)
    resource_save(@inventory, admin_venue_path(@venue), new_admin_venue_inventory_path(@venue))
  end

  def index
    @venues = current_user.venues
  end

  def show
  end

  def edit
  end

  def update
    @inventory.assign_attributes(post_params)
    resource_save(
      @inventory, 
      admin_venue_inventory_path(@venue, @inventory), 
      edit_admin_venue_inventory_path(@venue, @inventory)
    )
  end

  def destroy
    @inventory.destroy
    redirect_to admin_venue_path(@venue)
  end

  private

  def set_venue
    @venue = current_user.venues.find_by(slug: params[:venue_slug])
    redirect_to admin_path unless @venue
  end

  def set_inventory
    @inventory = @venue.inventories.find_by_id(params[:id])
    redirect_to admin_inventories_path unless @inventory
  end

  def post_params
    params.require(:inventory).permit(:name, :venue_id)
  end
end
