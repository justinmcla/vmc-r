class Admin::BookingsController < Admin::AdminController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def new
    @booking = Booking.new
  end

  def create
    @booking = current_user.bookings.build(post_params)
    resource_save(@booking, admin_bookings_path, new_admin_booking_path)
  end

  def index
    @bookings = params[:query].blank? ? current_user.bookings : current_user.bookings.by_organizer(params[:query])
  end

  def show
  end

  def edit
  end

  def update
    @booking.assign_attributes(post_params)
    params[:booking][:files].each { |file| @booking.files.attach(file) } if params[:booking][:files]
    resource_save(@booking, admin_booking_path(@booking), edit_admin_booking_path(@booking))
  end

  def destroy
    @booking.destroy
    redirect_to admin_bookings_path
  end

  private

  def set_booking
    @booking = Booking.find_by_id(params[:id])
  end

  def post_params
    params.require(:booking).permit(
      :name, :event_type, :date, 
      :event_time, :access_time, 
      :exit_time, :recurring,
      :description, :attendance, 
      :catering, :alcohol, :lighting, 
      :spotlight, :sound, :microphones, 
      :security, :road_closure, 
      :daily_rate, :venue_id,
      :organizer_id, :contract, :deposit, 
      :paid, employee_ids: [])
  end
end
