class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :author 
      t.string :body, null: false
      t.belongs_to :recipe, foreign_key: true
      
      t.timestamps
    end
  end
end
