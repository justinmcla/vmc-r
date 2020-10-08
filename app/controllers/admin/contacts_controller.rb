class Admin::ContactsController < AdminController
    def destroy
        @organizer = current_user.organizers.find_by_id(params[:organizer_id])
        @contact = @organizer.contacts.find_by_id(params[:id])
        @contact.destroy
        redirect_to admin_organizer_path(@organizer)
    end
end
