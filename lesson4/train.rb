class Train
  attr_reader :speed, :route, :current_station_index, :number

  def initialize(number)
    @number = number
    @cars = []
    @speed = 0
  end

  def increase_speed
    @speed += 10
  end

  def stop_train
    @speed = 0
  end

  def add_car(car)
    @cars << car if speed == 0
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
    if next_station
      current_station.departure self
      @current_station_index += 1
      current_station.arrival self
    end
  end

  def go_to_previous_station
    if previous_station
      current_station.departure self
      @current_station_index -= 1
      current_station.arrival self
    end
  end

  private
  # методы являются приватными, т.к. на данном этапе отсутствует функциональность для которой необходимо предоставлять такой интерфейс
  
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
