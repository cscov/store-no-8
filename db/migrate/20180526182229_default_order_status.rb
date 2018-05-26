class DefaultOrderStatus < ActiveRecord::Migration[5.1]
  def change
    change_column_default :orders, :order_status, "processing"
  end
end
