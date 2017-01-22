class CreateClientProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :client_profiles do |t|
      t.string :name
      t.string :phone
      t.date :birthdate
      t.string :phone_model

      t.timestamps
    end
  end
end
