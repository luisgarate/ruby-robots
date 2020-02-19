class CreateLasers < ActiveRecord::Migration
  def change
    create_table :lasers do |t|
      t.boolean :defect
      t.references :car
      t.timestamps null: false
    end
  end
end
