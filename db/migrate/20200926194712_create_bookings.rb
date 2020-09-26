class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.string :name, null: false
      t.string :event_type, null: false
      t.date :date, null: false
      t.time :event_time, null: false
      t.time :access_time, null: false
      t.time :exit_time, null: false
      t.boolean :recurring?
      t.text :description
      t.integer :attendance, null: false
      t.boolean :catering
      t.boolean :alcohol
      t.boolean :lighting
      t.boolean :spotlight
      t.boolean :sound
      t.boolean :microphones
      t.boolean :security
      t.boolean :road_closure
      t.decimal :daily_rate, null:false

      t.timestamps
    end
  end
end
