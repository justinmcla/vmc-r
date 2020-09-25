class CreateOrganizers < ActiveRecord::Migration[6.0]
  def change
    create_table :organizers do |t|
      t.string :name, null: false
      t.integer :user_id
      t.string :url

      t.timestamps
    end
  end
end
