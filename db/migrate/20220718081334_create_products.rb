class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.integer :quantity
      t.timestamps
      
      t.index :name, unique: true
    end
  end
end
