class AddClientRefToClientProfiles < ActiveRecord::Migration[5.0]
  def change
    add_reference :client_profiles, :client, foreign_key: true
  end
end
