# Класс Station (Станция):
# Имеет название, которое указывается при ее создании
# Может принимать поезда (по одному за раз)
# Может возвращать список всех поездов на станции, находящиеся в текущий момент
# Может возвращать список поездов на станции по типу (см. ниже): кол-во грузовых, пассажирских
# Может отправлять поезда (по одному за раз, при этом, поезд удаляется из списка поездов, находящихся на станции).

class Station
  attr_reader :trains, :station_name

  def initialize(station_name)
    @station_name = station_name
    @trains = []
  end

  def get_trains_by_type(type)
    @trains.select { |train| train.type == type }
  end

  def arrival(train)
    @trains.push train
    puts "Train ##{train.id} arrived to #{station_name} station"
    puts "Trains on the station: #{trains.map { |t| t.id }}"
  end

  def departure(train)
    @trains.delete train
    puts "Train ##{train.id} departured from #{station_name} station"
    puts "Trains on the station: #{trains.map { |t| t.id }}"
  end
end
