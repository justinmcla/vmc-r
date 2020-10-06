class Admin::PointOfContactsController < AdminController

    def organizer_point_of_contact_destroy
        @organizer = current_user.organizers.find_by_id(params[:organizer_id])
        @point_of_contact = @organizer.point_of_contacts.find_by_id(params[:id])
        @point_of_contact.destroy
    end
    
end