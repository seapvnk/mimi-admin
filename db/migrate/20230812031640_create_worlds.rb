class CreateWorlds < ActiveRecord::Migration[7.0]
  def change
    create_table :worlds do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
