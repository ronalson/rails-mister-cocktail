class RenameColumnInDoses < ActiveRecord::Migration[5.1]
  def change
    rename_column :doses, :description, :quantity
  end
end
