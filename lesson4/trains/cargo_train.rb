require_relative 'train'

class CargoTrain < Train
  def add_car(car)
    super(car) if car.is_a?(CargoCar)
  end
end
