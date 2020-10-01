class Admin::BookingsController < AdminController
    before_action :set_booking, only: [:show, :edit, :update, :destroy]

    def new
        @booking = Booking.new
    end

    def create
        @booking = current_user.bookings.build(post_params)
        if @booking.save
            redirect_to admin_bookings_path
        else
            render :new
        end
    end

    def index
        @bookings = current_user.bookings.all
    end

    def show
    end

    def edit
    end

    def update
        @booking.assign_attributes(post_params)
        if @booking.save
            redirect_to admin_booking_path(@booking)
        else
            render :edit
        end
    end

    def destroy
        @booking.destroy
        redirect_to home_path
    end

    private

    def set_booking
        @booking = Booking.find_by_id(params[:id])
    end

    def post_params
        params.require(:booking).permit(:name, :event_type, :date, :event_time,
                                        :access_time, :exit_time, :recurring,
                                        :description, :attendance, :catering, :alcohol,
                                        :lighting, :spotlight, :sound, :microphones, 
                                        :security, :road_closure, :daily_rate, :venue_id,
                                        :organizer_id)
    end


end
