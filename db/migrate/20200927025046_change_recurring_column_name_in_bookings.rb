class ChangeRecurringColumnNameInBookings < ActiveRecord::Migration[6.0]
  def change
    rename_column :bookings, :recurring?, :recurring
  end
end
