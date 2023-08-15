class CreateMaps < ActiveRecord::Migration[7.0]
  def change
    create_table :maps do |t|
      t.string :name
      t.string :description
      t.string :collision_mask
      t.string :background
      t.string :foreground
      t.references :world, null: false, foreign_key: true

      t.timestamps
    end
  end
end
