class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.float :price
      t.float :cost_price
      t.string :line
      t.string :place
      t.string :model
      t.integer :year
      t.boolean :complete
      t.boolean :store
      t.boolean :sold
      t.boolean :ready_to_store
      t.integer :wheels_count
      t.integer :seats_count
      t.timestamps null: false
    end
  end
end
