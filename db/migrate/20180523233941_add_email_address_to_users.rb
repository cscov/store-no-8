class AddEmailAddressToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :email_address, :string, presence: true, unique: true
  end
end
