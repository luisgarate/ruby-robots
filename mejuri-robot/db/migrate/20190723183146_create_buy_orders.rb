class CreateBuyOrders < ActiveRecord::Migration
  def change
    create_table :buy_orders do |t|
      t.float :price
      t.references :car
      t.timestamps null: false
    end
  end
end
