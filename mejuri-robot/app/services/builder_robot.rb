class BuilderRobot
  require "faker"

  def self.config_setup
    @f_vehicle = Faker::Vehicle
    @f_boolean = Faker::Boolean
    @f_number = Faker::Number
    @models = ["Altima", "Fiesta", "M3", "X5", "S5", "Civic", "M5", "CR-V", "X3", "Navigator"]
    @lines = ["Basic structure", "Electronic devices", "Painting and final details"]
  end

  def self.wipe_cars
    cars_in_warehouse = Car.where(ready_to_store: false)
    cars_in_warehouse.destroy_all unless cars_in_warehouse.empty?
  end

  def self.build_cars
    config_setup

    10.times do
      car = Car.new()
      car.model = @models.sample
      car.year = @f_vehicle.year
      car.line = @lines.sample
      car.place = "Factory"
      car.cost_price = @f_number.decimal(5,2).to_f.round(2)
      car.price =  car.cost_price * 1.5
      car.complete = false
      car.store = false
      car.ready_to_store = false
      car.sold = false

      line_handler(car)

      car.save
      car.computer.parts_status if car.is_completed?
    end
  end

  def self.line_handler(car)
    case car.line
    when "Basic structure"
      first_line(car)
    when "Electronic devices"
      first_line(car)
      second_line(car)
    when "Painting and final details"
      first_line(car)
      second_line(car)
      third_line(car)
    end
  end

  def self.first_line(car)
    4.times do
      car.wheels << Wheel.new(defect: @f_boolean.boolean(0.1))
    end
    car.chassis = Chassis.new(defect: @f_boolean.boolean(0.1))
    car.engine = Engine.new(defect: @f_boolean.boolean(0.1))
    car.line = "Electronic devices"
  end

  def self.second_line(car)
    car.laser = Laser.new(defect: @f_boolean.boolean(0.1))
    car.computer = Computer.new(defect: @f_boolean.boolean(0.1))
    car.line = "Painting and final details"
  end

  def self.third_line(car)
    2.times do
      car.seats << Seat.new(defect: @f_boolean.boolean(0.1))
    end
    car.complete = true
    car.place = "Warehouse"
  end
end
