class Admin::OrganizersController < Admin::AdminController
  before_action :set_organizer, only: [:show, :edit, :update, :destroy, :add_poc]

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
      redirect_to admin_path, notice: "Organizer saved successfully!"
    else
      redirect_to new_admin_organizer_path, alert: @organizer.errors.full_messages
    end
  end

  def index
    @organizers = current_user.organizers.all
  end

  def show
  end

  def edit
  end

  def update
    @organizer.assign_attributes(post_params)
    resource_save(
      @organizer, 
      admin_organizer_path(@organizer), 
      edit_admin_organizer_path(@organizer)
    )
  end

  def destroy
    @organizer.destroy
    redirect_to admin_organizers_path
  end

  private

  def set_organizer
    @organizer = Organizer.find_by_id(params[:id])
    redirect_to admin_organizers_path unless @organizer
  end

  def post_params
    params.require(:organizer).permit(
      :name, 
      :organization_type, 
      :url,
      address_attributes: [
        :id,
        :address_1,
        :address_2,
        :city, :state, :zip ], 
      point_of_contacts_attributes: [
        :id,
        :name,
        contacts_attributes: [
          :id,
          :via,
          :value ]], 
      contacts_attributes: [
          :id,
          :via,
          :value ])
  end

end
