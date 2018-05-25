class ChangePriceCalculation < ActiveRecord::Migration[5.1]
  def change
    change_column :items, :price, :decimal, precision: 8, scale: 2
  end
end
