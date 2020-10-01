class AddSlugToVenues < ActiveRecord::Migration[6.0]
  def change
    add_column :venues, :slug, :string, null: false
  end
end
