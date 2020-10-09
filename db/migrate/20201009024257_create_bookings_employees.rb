class CreateBookingsEmployees < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings_employees do |t|
      t.belongs_to :booking
      t.belongs_to :employee
    end
  end
end
