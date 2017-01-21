class CreateClients < ActiveRecord::Migration[5.0]
  def change
    create_table :clients do |t|
      t.string :client_number

      t.timestamps
    end
    add_index :clients, :client_number, unique: true
  end
end
