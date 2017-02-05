class AddArchivedToVendor < ActiveRecord::Migration[5.0]
  def change
    add_column :vendors, :archived, :boolean, default: false
  end
end
