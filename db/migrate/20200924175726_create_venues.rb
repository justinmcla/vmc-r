class CreateVenues < ActiveRecord::Migration[6.0]
  def change
    create_table :venues do |t|
      t.integer :user_id, null: false, foreign_key: true
      t.string :name, null: false
      t.integer :seats, null: false
      t.string :configuration, null: false
      t.integer :greenrooms, null: false
      t.integer :dressing_rooms, null: false

      t.timestamps
    end
  end
end
