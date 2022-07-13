class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :author #dodajemu autora , jesli go nie ma "unnown"
      t.string :body, null: false
      t.belongs_to :recipe, foreign_key: true
      
      t.timestamps
    end
  end
end
