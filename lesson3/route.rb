# Класс Route (Маршрут):
# Имеет начальную и конечную станцию, а также список промежуточных станций. Начальная и конечная станции указываютсся при создании маршрута, а промежуточные могут добавляться между ними.
# Может добавлять промежуточную станцию в список
# Может удалять промежуточную станцию из списка
# Может выводить список всех станций по-порядку от начальной до конечной

class Route

  attr_reader :route_length
  
  def initialize(params = {})
    @start_station = params[:start_station]
    @end_station = params[:end_station]
    @in_between_stations = []
    @route_length = 2
  end

  def delete_station(station)
    @in_between_stations.delete station
    @route_length = stations.size
    puts 'Station deleted'
  end

  def add_station(station)
    @in_between_stations.push station
    @route_length = stations.size
    puts 'Station added'
  end

  def print_stations
    puts stations.map { |station| station.station_name }
  end

  def stations
    [@start_station] + @in_between_stations + [@end_station]
  end
  
end
