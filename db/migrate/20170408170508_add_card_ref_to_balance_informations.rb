class AddCardRefToBalanceInformations < ActiveRecord::Migration[5.0]
  def change
    add_reference :balance_informations, :card, foreign_key: true
  end
end
