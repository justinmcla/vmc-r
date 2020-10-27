class Admin::PointOfContactsController < Admin::AdminController
  before_action :set_organizer_and_point_of_contact

  def destroy
    @point_of_contact.destroy
    redirect_to admin_organizer_path(@organizer)
  end

  private

  def set_organizer_and_point_of_contact
    @organizer = current_user.organizers.find_by_id(params[:organizer_id])
    @point_of_contact = @organizer.point_of_contacts.find_by_id(params[:id])
    redirect_to admin_organizers_path unless @organizer && @point_of_contact
  end
end