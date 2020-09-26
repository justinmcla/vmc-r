class CreatePointOfContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :point_of_contacts do |t|
      t.string :name, null: false
      t.integer :organizer_id

      t.timestamps
    end
  end
end
