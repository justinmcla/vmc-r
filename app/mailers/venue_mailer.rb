class VenueMailer < ApplicationMailer
    def booking_query
        @sender = params[:sender]
        @admin = params[:admin]
        @venue = params[:venue]
        attachments.inline['VMC.png'] = File.read(Rails.root.join('app/assets/images/VMC.png'))
        mail(to: @admin.email, subject: 'Booking Query on VenueMC!')
    end
end
