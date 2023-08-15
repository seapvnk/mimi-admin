class AddSignatureToMaps < ActiveRecord::Migration[7.0]
  def change
    add_column :maps, :signature, :string
  end
end
