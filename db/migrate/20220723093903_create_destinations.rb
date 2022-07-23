class CreateDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :destinations do |t|

      t.string :postal_code,                 null: false
      t.integer :prefacture_id,              null: false
      t.string :city,                        null: false
      t.string :house_number,                null: false
      t.string :building_name,               null: false
      t.string :telephone_number,            null: false
      t.references :purchase_management,     null: false, foreign_key: true
      t.timestamps
    end
  end
end
