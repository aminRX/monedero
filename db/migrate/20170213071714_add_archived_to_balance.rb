class AddArchivedToBalance < ActiveRecord::Migration[5.0]
  def change
    add_column :balances, :archived, :bool, default: false
  end
end
