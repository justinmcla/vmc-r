class VenueMailerPreview < ActionMailer::Preview
    def booking_query
        @sender = {
            name: 'Jane Doe',
            email: 'mail@mail.com',
            message: 'Hello! I\'d like to book your venue!'
        }
        @venue = Venue.first
        @admin = @venue.user
        VenueMailer.with(sender: @sender, venue: @venue, admin: @admin).booking_query
    end
end