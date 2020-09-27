class AddVenueIdAndOrganizerIdToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :venue_id, :integer
    add_column :bookings, :organizer_id, :integer
  end
end
