class CreateEngines < ActiveRecord::Migration
  def change
    create_table :engines do |t|
      t.boolean :defect
      t.references :car
      t.timestamps null: false
    end
  end
end
