class AddEmailToVendor < ActiveRecord::Migration[5.0]
  def change
    add_column :vendors, :email, :string
    add_index :vendors, :email, unique: true
  end
end
