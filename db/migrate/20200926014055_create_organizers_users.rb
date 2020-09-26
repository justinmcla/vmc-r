class CreateOrganizersUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :organizers_users do |t|
      t.integer :organizer_id
      t.integer :user_id
    end
  end
end
