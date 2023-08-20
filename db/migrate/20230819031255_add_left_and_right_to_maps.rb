class AddLeftAndRightToMaps < ActiveRecord::Migration[7.0]
  def change
    add_column :maps, :left_id, :integer
    add_column :maps, :right_id, :integer
  end
end
