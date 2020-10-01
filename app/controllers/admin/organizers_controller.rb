class Admin::OrganizersController < AdminController
    before_action :set_organizer, only: [:edit, :update, :destroy, :add_poc]

    def new
        @organizer = Organizer.new
        @organizer.build_address
        @organizer.contacts.build
        @organizer.point_of_contacts.build
        @organizer.point_of_contacts.last.contacts.build
    end

    def create
        @organizer = current_user.organizers.build(post_params)
        if @organizer.save
            current_user.organizers << @organizer
            redirect_to home_path
        else
            render :new
        end
    end

    def index
        @organizers = current_user.organizers.all
    end

    def edit
    end

    def update
        @organizer.assign_attributes(post_params)
        if @organizer.save
            redirect_to admin_organizers_path
        else
            render :edit
        end
    end

    def destroy
        @organizer.destroy
        redirect_to admin_organizers_path
    end

    def add_poc
        @organizer.point_of_contacts.build
        @organizer.point_of_contacts.last.contacts.build
        render :edit
    end

    private

    def set_organizer
        @organizer = Organizer.find_by_id(params[:id])
    end

    def post_params
        params.require(:organizer).permit(:name, :url,
                                            address_attributes: [
                                                :id,
                                                :address_1,
                                                :address_2,
                                                :city, :state, :zip
                                            ], point_of_contacts_attributes: [
                                                :id,
                                                :name,
                                                contacts_attributes: [
                                                    :id,
                                                    :via,
                                                    :value
                                                ]
                                            ], contacts_attributes: [
                                                :id,
                                                :via,
                                                :value
                                            ])
    end

end
