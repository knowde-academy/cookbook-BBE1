class AddCookingTimeToRecipes < ActiveRecord::Migration[6.1]
  def change
    add_column :recipes, :cooking_time, :integer
  end
end
