class Admin::VenuesController < Admin::AdminController
    layout 'admin'
    before_action :set_venue, only: [:show, :edit, :update, :destroy]

    def new
        @venue = Venue.new
        @venue.build_address
    end

    def create
        @venue = current_user.venues.build(post_params)
        if @venue.save
            redirect_to admin_path
        else
            render :new
        end
    end

    def show
    end

    def edit
    end

    def update
        @venue.assign_attributes(post_params)
        if @venue.save
            redirect_to admin_path
        else
            render :edit
        end
    end

    def destroy
        @venue.destroy
        redirect_to admin_path
    end

    private

    def set_venue
        @venue = current_user.venues.find_by_id(params[:id])
    end

    def post_params
        params.require(:venue).permit(:name, :configuration, :seats, :greenrooms, :dressing_rooms, 
                                        address_attributes: [:id, :address_1, :address_2, :city, :state, :zip])
    end
end
