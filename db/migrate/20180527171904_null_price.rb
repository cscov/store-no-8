class NullPrice < ActiveRecord::Migration[5.1]
  def change
    change_column_null :items, :price, true
  end
end
