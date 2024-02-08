class CreateResidences < ActiveRecord::Migration[7.0]
  def change
    create_table :residences do |t|
      t.string :postal_code, null: false
      t.integer :region_id, null: false
      t.string :city, null: false
      t.string :house_number, null: false
      t.string :building_name
      t.string :telephone, null: false
      t.references :order, null: false, foreign_key: true
      t.timestamps
    end
  end
end
