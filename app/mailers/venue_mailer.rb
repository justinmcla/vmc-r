class VenueMailer < ApplicationMailer
    def booking_query
        @sender = params[:sender]
        @admin = params[:admin]
        @venue = params[:venue]
        mail(to: @admin.email, subject: 'Booking Query on VenueMC!')
    end
end
