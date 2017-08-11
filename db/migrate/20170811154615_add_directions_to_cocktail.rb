class AddDirectionsToCocktail < ActiveRecord::Migration[5.1]
  def change
    add_column :cocktails, :directions, :string
  end
end
