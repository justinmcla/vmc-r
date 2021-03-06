class Admin::ItemsController < Admin::AdminController
  before_action :set_venue_and_inventory
  before_action :set_item, only: [:edit, :update, :destroy]

  def new
    @item = @inventory.items.build
  end

  def create
    @item = @inventory.items.build(post_params)
    resource_save(
      @item,
      admin_venue_inventory_path(@venue, @inventory),
      new_admin_venue_inventory_item_path
    )
  end

  def edit
  end

  def update
    @item.assign_attributes(post_params)
    resource_save(
      @item,
      admin_venue_inventory_path(@venue, @inventory),
      edit_admin_venue_inventory_item_path(@venue, @inventory, @item)
    )
  end

  def destroy
    @item.destroy
    redirect_to admin_venue_inventory_path(@venue, @inventory)
  end

  private

  def set_item
    @item = @inventory.items.find_by_id(params[:id])
    redirect_to admin_venue_inventory_path(@venue, @inventory) unless @item
  end

  def set_venue_and_inventory
    @venue = current_user.venues.find_by(slug: params[:venue_slug])
    redirect_to admin_path unless @venue
    @inventory = @venue.inventories.find_by_id(params[:inventory_id])
    redirect_to admin_venue_path(@venue) unless @inventory
  end

  def post_params
    params.require(:item).permit(:name, :quantity, :category, :notes, :inventory_id)
  end
end
