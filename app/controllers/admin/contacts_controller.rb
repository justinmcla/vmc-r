class Admin::ContactsController < Admin::AdminController
  before_action :set_organizer_and_contact
  
  def destroy
    @contact.destroy
    redirect_to admin_organizer_path(@organizer)
  end

  private 

  def set_organizer_and_contact
    @organizer = current_user.organizers.find_by_id(params[:organizer_id])
    redirect_to admin_organizers_path unless @organizer
    @contact = @organizer.contacts.find_by_id(params[:id])
    redirect_to admin_organizer_path(@organizer) unless @contact
  end
end
