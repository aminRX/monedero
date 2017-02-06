class CreatePercentCatalogs < ActiveRecord::Migration[5.0]
  def change
    create_table :percent_catalogs do |t|
      t.float :percent

      t.timestamps
    end
    add_index :percent_catalogs, :percent, unique: true
  end
end
