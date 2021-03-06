class CreateOrderItems < ActiveRecord::Migration[5.1]
  def change
    create_table :order_items do |t|
      t.integer :order_id, null: false
      t.integer :item_id, null: false
      t.timestamps
    end
    add_index :order_items, :order_id
    add_index :order_items, :item_id
  end
end
