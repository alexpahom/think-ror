# frozen_string_literal: true

class Train
  attr_reader :speed, :cars_number, :route, :type

  def initialize(number, type, cars_number)
    @number = number
    @type = type
    @cars_number = cars_number
    @speed = 0
  end

  def increase_speed
    @speed += 10
  end

  def stop_train
    @speed = 0
  end

  def add_car
    @cars_number += 1 if speed.zero?
  end

  def unhook_car
    @cars_number -= 1 unless cars_number.zero?
  end

  def assign_route(route)
    @route = route
    @current_station_index = 0
  end

  def go_to_next_station
    @current_station_index += 1 if next_station
  end

  def go_to_prev_station
    @current_station_index -= 1 if previous_station
  end

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
