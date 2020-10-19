module VenuesHelper

  def next_booking(venue)
    venue.bookings.select { |booking| booking.date > Date.today }.sort_by { |booking| booking.date }.first
  end

  def last_booking(venue)
    venue.bookings.select { |booking| booking.date < Date.today }.sort_by { |booking| booking.date }.last
  end
  
  def display_configuration(venue)
    html = <<~HTML
      <p>Configuration: #{venue.configuration}<br>
         Seats: #{venue.seats}<br>
         Dressing Rooms: #{venue.dressing_rooms}<br>
         Greenrooms: #{venue.greenrooms}</p>
    HTML
    html.html_safe
  end
  
end