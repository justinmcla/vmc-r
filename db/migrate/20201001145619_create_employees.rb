class CreateEmployees < ActiveRecord::Migration[6.0]
  def change
    create_table :employees do |t|
      t.string :name, null: false
      t.date :start_date, null: false
      t.date :end_date
      t.boolean :active, null: false
      t.decimal :rate, null: false
    end
  end
end
