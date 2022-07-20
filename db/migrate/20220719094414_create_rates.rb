class CreateRates < ActiveRecord::Migration[6.1]
  def change
    create_table :rates do |t|
      t.integer :value, null: false 
      t.belongs_to :recipe, foreign_key: true

      t.timestamps
    end
  end
end
