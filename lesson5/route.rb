load 'modules/instance_counter.rb'

class Route
  include InstanceCounter
  attr_reader :start_station, :end_station

  def initialize(start_station, end_station)
    @start_station = start_station
    @end_station = end_station
    @in_between_stations = []
    register_instance
  end

  def delete_station(station)
    @in_between_stations.delete station
  end

  def add_station(station)
    @in_between_stations.push station
  end

  def stations
    [@start_station] + @in_between_stations + [@end_station]
  end
end
