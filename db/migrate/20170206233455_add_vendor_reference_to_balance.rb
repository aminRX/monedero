class AddVendorReferenceToBalance < ActiveRecord::Migration[5.0]
  def change
    add_reference :balances, :vendor, foreign_key: true
  end
end
