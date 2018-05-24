class UpdateEmailAddressColumn < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :email_address, :string, null: false, unique: true
  end
end
