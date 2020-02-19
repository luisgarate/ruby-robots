class CreateChasses < ActiveRecord::Migration
  def change
    create_table :chasses do |t|
      t.boolean :defect
      t.references :car
      t.timestamps null: false
    end
  end
end
