class AddDeletedAtToMaps < ActiveRecord::Migration[7.0]
  def change
    add_column :maps, :deleted_at, :datetime
    add_index :maps, :deleted_at
  end
end
