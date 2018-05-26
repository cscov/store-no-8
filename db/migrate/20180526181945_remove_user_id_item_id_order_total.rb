class RemoveUserIdItemIdOrderTotal < ActiveRecord::Migration[5.1]
  def change
    remove_column :orders, :order_total
    remove_column :items, :order_id
  end
end
