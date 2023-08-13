class CreateTimelines < ActiveRecord::Migration[7.0]
  def change
    create_table :timelines do |t|
      t.integer :parent_id

      t.timestamps
    end
    add_index :timelines, :parent_id
  end
end
