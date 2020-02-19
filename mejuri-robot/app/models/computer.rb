class Computer < ActiveRecord::Base
  belongs_to :car

  def parts_status
    all_defects = []

    all_defects << {id: id, part: 'Computer'} if defect

    wheels = car.wheels.where(defect: true)
    wheels.each do |w|
      all_defects << {id: w.id, part: 'Wheel'} if w.defect
    end

    seats = car.seats.where(defect: true)
    seats.each do |s|
      all_defects << {id: s.id, part: 'Seat'} if s.defect
    end

    laser = car.laser
    all_defects << {id: laser.id, part: 'Laser'} if laser.defect

    chassis = car.chassis
    all_defects << {id: chassis.id, part: 'Chassis'} if chassis.defect

    if all_defects.empty?
      car.ready_to_store = true
      car.save
      return {msg: "The car has no defects and it's ready to go to the store", car_id: car.id}
    else
      return {msg: "The car with id #{car.id} has #{all_defects.size} defects", car_id: car.id, defects: all_defects}
    end
  end
end
