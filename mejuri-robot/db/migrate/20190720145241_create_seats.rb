class CreateSeats < ActiveRecord::Migration
  def change
    create_table :seats do |t|
      t.boolean :defect
      t.references :car
      t.timestamps null: false
    end
  end
end
