require_relative 'train'

class PassengerTrain < Train
  def add_car(car)
    super(car) if car.is_a?(PassengerCar)
  end
end
