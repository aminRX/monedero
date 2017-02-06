class AddPercentCatalogReferenceToBalance < ActiveRecord::Migration[5.0]
  def change
    add_reference :balances, :percent_catalog, foreign_key: true
  end
end
