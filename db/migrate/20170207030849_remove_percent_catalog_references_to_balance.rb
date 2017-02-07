class RemovePercentCatalogReferencesToBalance < ActiveRecord::Migration[5.0]
  def change
    remove_reference(:balances, :percent_catalog, index: true, foreign_key: true)
  end
end
