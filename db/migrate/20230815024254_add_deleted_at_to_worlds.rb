class AddDeletedAtToWorlds < ActiveRecord::Migration[7.0]
  def change
    add_column :worlds, :deleted_at, :datetime
    add_index :worlds, :deleted_at
  end
end
