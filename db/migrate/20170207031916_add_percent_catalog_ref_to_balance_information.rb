class AddPercentCatalogRefToBalanceInformation < ActiveRecord::Migration[5.0]
  def change
    add_reference :balance_informations, :percent_catalog, foreign_key: true
  end
end
