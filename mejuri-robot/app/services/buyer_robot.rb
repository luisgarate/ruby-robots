class BuyerRobot
  @limit_cars = 10
  @models = ["Altima", "Fiesta", "M3", "X5", "S5", "Civic", "M5", "CR-V", "X3", "Navigator"]
  @broker = BrokerRobot.new

  def self.buy_cars
    cars_buyed = 0
    cars_allowed_to_buy =  @limit_cars - cars_buyed
    while cars_allowed_to_buy > 0
      wanted_amount = rand(1..cars_allowed_to_buy)
      cars_allowed_to_buy -= wanted_amount
      cars_selected = select_cars(wanted_amount)
      @broker.request_cars(cars_selected)
    end
  end

  def self.select_cars(amount)
    cars = {}
    amount.times do
      model = @models.sample
      cars[model].nil? ? cars[model] = 1 : cars[model] += 1
    end
    cars
  end

end
