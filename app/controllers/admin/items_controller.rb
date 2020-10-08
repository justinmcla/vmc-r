class Admin::ItemsController < AdminController
    before_action :set_venue_and_inventory
    before_action :set_item, only: [:edit, :update, :destroy]

    def new
        @item = @inventory.items.build
    end

    def create
        @item = @inventory.items.build(post_params)
        if @item.save
            redirect_to admin_venue_inventory_path(@venue, @inventory)
        else
            render :new
        end
    end

    def edit
    end

    def update
        @item.assign_attributes(post_params)
        if @item.save
            redirect_to admin_venue_inventory_path(@venue, @inventory)
        else
            render :edit
        end
    end

    def destroy
        @item.destroy
        redirect_to admin_venue_inventory_path(@venue, @inventory)
    end

    private

    def set_item
        @item = @inventory.items.find_by_id(params[:id])
    end

    def set_venue_and_inventory
        @venue = current_user.venues.find_by_id(params[:venue_id])
        @inventory = @venue.inventories.find_by_id(params[:inventory_id])
    end

    def post_params
        params.require(:item).permit(:name, :quantity, :category, :notes, :inventory_id)
    end
end
