# frozen_string_literal: true

require_relative '../modules/manufacturer'
require_relative '../modules/instance_counter'

class Train
  include Manufacturer
  include InstanceCounter
  attr_reader :speed, :kind, :route, :current_station_index, :number, :cars

  def self.all_trains
    @trains
  end

  def self.add_train(train)
    @trains ||= []
    @trains << train
  end

  def self.find(number)
    all_trains.find { |train| train.number == number }
  end

  def initialize(number)
    @number = number
    @cars = []
    @speed = 0
    validate!
    self.class.add_train self
    register_instance
  end

  def increase_speed
    @speed += 10
  end

  def stop_train
    @speed = 0
  end

  def add_car(car)
    @cars << car if speed.zero? && car.kind == kind
  end

  def unhook_car
    @cars.pop
  end

  def assign_route(route)
    @route = route
    route.start_station.arrival self
    @current_station_index = 0
  end

  def go_to_next_station
    return unless next_station

    current_station.departure self
    @current_station_index += 1
    current_station.arrival self
  end

  def go_to_previous_station
    return unless previous_station

    current_station.departure self
    @current_station_index -= 1
    current_station.arrival self
  end

  def within_cars(&block)
    cars.each { |car| block.call(car) }
  end

  private

  def next_station
    route.stations[current_station_index + 1]
  end

  def previous_station
    route.stations[current_station_index - 1]
  end

  def current_station
    route.stations[current_station_index]
  end
end
