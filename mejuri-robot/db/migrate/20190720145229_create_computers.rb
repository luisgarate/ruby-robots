class CreateComputers < ActiveRecord::Migration
  def change
    create_table :computers do |t|
      t.boolean :defect
      t.references :car
      t.timestamps null: false
    end
  end
end
