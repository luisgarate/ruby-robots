class CreateLogEntries < ActiveRecord::Migration
  def change
    create_table :log_entries do |t|
      t.text :note
      t.timestamps null: false
    end
  end
end
