class AddTopAndBottomToMaps < ActiveRecord::Migration[7.0]
  def change
    add_column :maps, :top_id, :integer
    add_column :maps, :bottom_id, :integer
  end
end
