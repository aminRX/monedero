class CreateBalanceInformations < ActiveRecord::Migration[5.0]
  def change
    create_table :balance_informations do |t|
      t.float :amount
      t.string :note_number

      t.timestamps
    end
  end
end
