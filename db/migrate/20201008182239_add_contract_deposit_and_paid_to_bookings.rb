class AddContractDepositAndPaidToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :contract, :boolean
    add_column :bookings, :deposit, :boolean
    add_column :bookings, :paid, :boolean
  end
end
