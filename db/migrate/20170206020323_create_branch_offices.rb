class CreateBranchOffices < ActiveRecord::Migration[5.0]
  def change
    create_table :branch_offices do |t|
      t.string :name, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :branch_offices, :name, unique: true
  end
end
