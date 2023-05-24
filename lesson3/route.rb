class Route
  def initialize(start_station, end_station)
    @start_station = start_station
    @end_station = end_station
    @in_between_stations = []
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
