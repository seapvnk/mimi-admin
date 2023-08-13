class AddSignatureToWorlds < ActiveRecord::Migration[7.0]
  def change
    add_column :worlds, :signature, :string
  end
end
