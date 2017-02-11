class AddBalanceRefToBalanceInformation < ActiveRecord::Migration[5.0]
  def change
    add_reference :balance_informations, :balance, foreign_key: true
  end
end
