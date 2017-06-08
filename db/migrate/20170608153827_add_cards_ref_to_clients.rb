class AddCardsRefToClients < ActiveRecord::Migration[5.0]
  def change
    add_reference :clients, :card, foreign_key: true
  end
end
