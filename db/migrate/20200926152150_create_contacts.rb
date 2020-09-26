class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.string :via, null: false
      t.string :value, null: false
      t.integer :contactable_id
      t.string :contactable_type

      t.timestamps
    end
  end
end
