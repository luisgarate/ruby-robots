class Warehouse < ActiveRecord::Base

  def self.factory_stock
    Car.ready_in_warehouse.not_sold.count
  end

  def self.factory_by_model_stock(model)
    Car.ready_in_warehouse.not_sold.by_model(model).count
  end

  def self.factory_stock_ready_to_store_detailed
    Car.select(:model).ready_in_warehouse.not_sold.group(:model).count
  end

end
