class Admin::InsightsController < Admin::AdminController
  def index
    @bookings = params[:query].blank? ? current_user.bookings : current_user.bookings.by_event_type(params[:query])
    @venues = current_user.venues
  end
end