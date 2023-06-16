require_relative 'route'
require_relative 'trains/cargo_train'
require_relative 'trains/passenger_train'
require_relative 'cars/cargo_car'
require_relative 'cars/passenger_car'
require_relative 'station'
require 'singleton'

class Seeds
  include Singleton
  attr_reader :trains, :routes

  def initialize
    @routes = []
    @trains = []
    create_route
    create_trains
    assign_trains
  end

  def create_route
    stations = [
      'Minsk',
      'Moscow',
      'Paris',
      'New Orleans',
      'Hamburg',
      'California',
      'Washington D.C.',
    ].map do |city|
      Station.new city
    end.shuffle
    route = Route.new(stations.pop, stations.pop)
    stations.each { |station| route.add_station station }
    @routes << route
  end

  def create_trains
    5.times do |_i|
      train = CargoTrain.new(generate_train_number)
      5.times { train.add_car CargoCar.new(rand(1..50)) }
      @trains << train
    end

    5.times do |_i|
      train = PassengerTrain.new(generate_train_number)
      5.times { train.add_car PassengerCar.new(rand(1..50)) }
      @trains << train
    end
  end

  def assign_trains
    @trains.each do |train|
      train.assign_route @routes.sample
    end
  end

  def generate_train_number
    (0..4).map { [*'0'..'9', *'a'..'z'][rand(36)] }.join.insert(3, '-')
  end
end
