class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.decimal :price, null: false
      t.integer :order_id
      t.timestamps
    end
    add_index :items, :order_id
  end
end
