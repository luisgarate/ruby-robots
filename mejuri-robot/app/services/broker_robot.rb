class BrokerRobot
  @models = ["Altima", "Fiesta", "M3", "X5", "S5", "Civic", "M5", "CR-V", "X3", "Navigator"]

  def store_stock_detailed
    Car.select(:model).in_store.not_sold.group(:model).count
  end

  def get_store_cars(model)
    Car.by_model(model).in_store.not_sold
  end

  def get_factory_cars(model)
    Car.by_model(model).ready_in_warehouse.not_sold
  end


  def request_cars(cars)
    remaining_cars = buy_with_store_stock(cars)
    buy_with_factory_stock(remaining_cars) if remaining_cars.values.sum > 0
  end

  def buy_with_store_stock(cars)
    s_stock = store_stock_detailed
    remaining_cars = {}
    if !s_stock.empty?
      cars.each do |key,value|
        s_cars = get_store_cars(key)
        if !s_cars.empty?
          value, s_stock[key] = process_transaction(value, s_stock[key], s_cars)
          remaining_cars[key] = value
        end
      end
    else
      remaining_cars = cars
    end
    remaining_cars
  end

  def buy_with_factory_stock(cars)
    f_stock = Warehouse.factory_stock_ready_to_store_detailed
    remaining_cars = {}
    cars.each do |key,value|
      f_cars = get_factory_cars(key)
      if f_cars.empty?
        value = generate_logs(value,key)
      else
        value, f_stock[key] = process_transaction(value, f_stock[key], f_cars)
        remaining_cars[key] = value
      end
    end
    remaining_cars
  end

  def process_transaction(value,stock,cars)
    while value > 0 && stock != 0
      if cars.any?
        car = cars.first
        car.update(sold: true)
        BuyOrder.create(car: car, price: car.price)
        stock -= 1
        value -= 1
        cars = get_factory_cars(car.model)
      end
    end
    return value, stock
  end

  def generate_logs(value,key)
    while value > 0
      LogEntry.create(note: "The purchase of a #{key} could not be satisfied because a lack of stock")
      value -= 1
    end
    return value
  end

end
