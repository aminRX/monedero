class CreateBalances < ActiveRecord::Migration[5.0]
  def change
    create_table :balances do |t|
      t.float :point
      t.references :client, foreign_key: true

      t.timestamps
    end
  end
end
