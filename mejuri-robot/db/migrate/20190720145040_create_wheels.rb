class CreateWheels < ActiveRecord::Migration
  def change
    create_table :wheels do |t|
      t.boolean :defect
      t.references :car  
      t.timestamps null: false
    end
  end
end
