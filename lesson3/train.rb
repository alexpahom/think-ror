# Класс Train (Поезд):
# Имеет номер (произвольная строка) и тип (грузовой, пассажирский) и количество вагонов, эти данные указываются при создании экземпляра класса
# Может набирать скорость
# Может возвращать текущую скорость
# Может тормозить (сбрасывать скорость до нуля)
# Может возвращать количество вагонов
# Может прицеплять/отцеплять вагоны (по одному вагону за операцию, метод просто увеличивает или уменьшает количество вагонов). Прицепка/отцепка вагонов может осуществляться только если поезд не движется.
# Может принимать маршрут следования (объект класса Route). 
# При назначении маршрута поезду, поезд автоматически помещается на первую станцию в маршруте.
# Может перемещаться между станциями, указанными в маршруте. Перемещение возможно вперед и назад, но только на 1 станцию за раз.
# Возвращать предыдущую станцию, текущую, следующую, на основе маршрута

class Train

  attr_reader :speed, :cars_number, :route, :type, :id
  
  def initialize(params = {})
    @id = params[:id]
    @type = params[:type]
    @cars_number = params[:cars_number]
    @speed = 0
    @route = nil
    @route_position = 1
    @prev_station = nil
    @current_station = nil
    @next_station = nil
  end

  def increase_speed
    @speed += 10
    puts "Speed increased up to #{speed}"
  end

  def stop_train
    @speed = 0
    puts 'Train stopped'
  end

  def add_car
    if @speed == 0
      @cars_number += 1
      puts 'Car added successfully'
    else
      puts 'Cannot add a car on the go. Stop the train and retry.'
    end
  end

  def unhook_car
    if cars_number == 0
      puts 'No cars no unhook.'
      return
    end
    
    if speed == 0
      @cars_number -= 1
      puts "Car unhooked successfully. Cars: #{cars_number}"
    else
      puts 'Cannot unhook a car on the go. Stop the train and retry.'
    end  
  end

  def route=(route)
    @route = route
    self.current_station = route.stations[@route_position - 1]
    @next_station = route.stations[@route_position]
    puts "Train ##{self.id} has route assigned"
  end

  def go_to_next_station
    if @route_position == route.route_length
      puts 'You are on the end station already.'
      return
    end
    
    @route_position += 1
    self.prev_station = route.stations[@route_position - 2]
    self.current_station = route.stations[@route_position - 1]
    @next_station =
      if @route_position == route.route_length
        @current_station
      else
        route.stations[@route_position]
      end
    print_location
  end

  def go_to_prev_station
    if @route_position == 1
      puts 'You are on the initial station already.'
      return
    end

    @route_position -= 1
    self.prev_station = route.stations[@route_position]
    self.current_station = route.stations[@route_position - 1]
    @next_station = 
      if @route_position == 1
        @current_station
      else
        route.stations[@route_position - 2]
      end
    print_location
  end

  def print_location
    puts "Previous station: #{@prev_station.station_name}"
    puts "Current station: #{@current_station.station_name}"
    puts "Next station: #{@next_station.station_name}"
  end

  private 
  
  def prev_station=(value)
    @prev_station = value
    @prev_station.departure self
  end

  def current_station=(value)
    @current_station = value
    @current_station.arrival self
  end
end
