class AddEmailToClientProfile < ActiveRecord::Migration[5.0]
  def change
    add_column :client_profiles, :email, :string
    add_index :client_profiles, :email, unique: true
  end
end
