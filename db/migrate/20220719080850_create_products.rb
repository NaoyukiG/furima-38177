class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|

      t.string :title,            null: false
      t.text :content,            null: false
      t.integer :category_id,     null: false
      t.integer :status_id,       null: false
      t.integer :charge_id,       null: false
      t.integer :prefacture_id,   null: false
      t.integer :shipping_day_id, null: false
      t.integer :price,           null: false
      t.references :user,         null: false, foreign_key: true
      t.timestamps
    end
  end
end
