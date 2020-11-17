class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      
      t.string     :name,                null:false
      t.integer    :condition_id,        null:false
      t.integer    :price,               null:false
      t.integer    :category_id,         null:false
      t.integer    :delivery_price_id,   null:false
      t.integer    :shipment_source_id,  null:false
      t.integer    :days_to_ship_id,        null:false
      t.text       :information,         null:false
      t.references :user,                foreign_key: true

      

      t.timestamps
    end
  end
end
