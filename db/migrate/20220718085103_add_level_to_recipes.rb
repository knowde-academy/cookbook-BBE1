class AddLevelToRecipes < ActiveRecord::Migration[6.1]
  def change
    add_column :recipes, :level, :integer
  end
end
