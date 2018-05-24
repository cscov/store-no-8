class AddOrderSummary < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :order_total, :decimal
  end
end
