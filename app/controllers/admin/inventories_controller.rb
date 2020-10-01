class Admin::InventoriesController < AdminController
    before_action :set_venue
    def new
        @inventory = @venue.inventories.build
    end

    def create
        @inventory = @venue.inventories.build(post_params)
        if @inventory.save
            redirect_to admin_venue_path(@venue)
        else
            render :new
        end
    end

    private

    def set_venue
        @venue = current_user.venues.find_by_id(params[:venue_id])
    end

    def post_params
        params.require(:inventory).permit(:name, :venue_id)
    end
end