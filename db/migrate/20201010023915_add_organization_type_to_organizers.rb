class AddOrganizationTypeToOrganizers < ActiveRecord::Migration[6.0]
  def change
    add_column :organizers, :organization_type, :string
  end
end
