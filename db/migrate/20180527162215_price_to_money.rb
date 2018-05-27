class PriceToMoney < ActiveRecord::Migration[5.1]
  def change
    add_monetize :items, :price
  end
end
