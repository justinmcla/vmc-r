class AddInventoryIdToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :inventory_id, :integer
  end
end
