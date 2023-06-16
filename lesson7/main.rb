require_relative 'station.rb'
require_relative 'route.rb'
require_relative 'trains/cargo_train.rb'
require_relative 'trains/passenger_train.rb'
require_relative 'cars/cargo_car.rb'
require_relative 'cars/passenger_car.rb'
require_relative 'seeds'
require 'pry'

@trains = Seeds.instance.trains
@routes = Seeds.instance.routes

def render_menu
  puts '1 - Создать поезд'
  puts '2 - Создать маршрут'
  puts '3 - Назначить маршрут'
  puts '4 - Добавить вагон'
  puts '5 - Отцепить вагон'
  puts '6 - Переместить поезд'
  puts '7 - Информация о станциях и поездах'
  puts '8 - Изменить вагон'
  puts '9 - Выход'
end

def create_train
  print 'Введите номер поезда: '
  number = gets.chomp
  print 'Введите тип поезда (пассажирский/грузовой): '
  type = gets.chomp.downcase
  if type == 'пассажирский'
    @trains << PassengerTrain.new(number)
  elsif type == 'грузовой'
    @trains << CargoTrain.new(number)
  else
    raise 'Неверный тип поезда'
  end
  puts "Создан #{type} поезд, номер #{number}"
  gets
rescue Exception => e
  puts e.message
  retry
end

def create_route
  print 'Введите начальную станцию маршрута: '
  start_station = create_station(gets.chomp)
  print 'Введите конечную станцию маршрута: '
  end_station = create_station(gets.chomp)
  route = Route.new(start_station, end_station)
  loop do
    print 'Введите название промежуточной станции или "стоп" для выхода: '
    station_name = gets.chomp
    break if station_name == 'стоп'
    route.add_station(station_name)
  end
  @routes << route
end

def create_station(name)
  Station.new(name)
rescue Exception => e
  puts e.message
  print 'Введите новое значение: '
  retry
end

def assign_route
  print_routes
  print_trains
  train = get_train_from_user
  print 'Введите номер маршрута: '
  route_number = gets.chomp.to_i
  train.assign_route(@routes[route_number - 1])
end

def add_car
  print_trains
  train = get_train_from_user
  if train.is_a? CargoTrain
    train.add_car(create_cargo_car)
  elsif train.is_a? PassengerTrain
    train.add_car(create_passenger_car)
  end
end

def create_cargo_car
  print 'Введите максимальную вместимость: '
  car_load = gets.chomp
  CargoCar.new(car_load)
rescue Exception => e
  puts e.message
  retry
end

def create_passenger_car
  print 'Введите количество мест в вагоне: '
  max_seats = gets.chomp
  PassengerCar.new(max_seats)
rescue Exception => e
  puts e.message
  retry
end

def unhook_car
  print_trains
  get_train_from_user.unhook_car
end

def move_train
  print_trains
  train = get_train_from_user
  print 'Введите направление движения (вперед/назад)'
  direction = gets.chomp.downcase
  if direction == 'вперед'
    train.go_to_next_station
  elsif direction == 'назад'
    train.go_to_previous_station
  end
end

def get_stations_and_trains
  @routes.each do |route|
    puts "Маршрут: #{route.start_station.name} - #{route.end_station.name}"
    route.stations.each do |station|
      puts "\tСтанция: #{station.name}"
      print_station_info(station)
    end
  end
  gets
end

def print_station_info(station)
  if station.trains.empty?
    puts "Поезда отсутствуют"
    return
  end
  station.within_trains do |train|
    puts "\tПоезд номер: #{train.number} Тип: #{train.type} Кол-во вагонов: #{train.cars.count}"
    print_train_info train
  end
end

def print_train_info(train)
  puts "\t\tВагоны:"
  train.within_cars do |car|
    if car.is_a? PassengerCar
      puts "\t\tНомер:#{car.number} Тип:#{car.type} Мест занято:#{car.seats_taken_number} Мест свободно:#{car.vacant_seats_number}"
    elsif car.is_a? CargoCar
      puts "\t\tНомер:#{car.number} Тип:#{car.type} Объема занято:#{car.loaded} Объема свободно:#{car.free_load}"
    end
  end
end

def print_trains
  puts 'Поезда: '
  @trains.each { |train| puts train.number }
end

def print_routes
  puts 'Маршруты'
  @routes.each_with_index do |route, index|
    puts "#{index + 1} #{route.start_station.name} - #{route.end_station.name}"
  end
end

def get_train_from_user
  print 'Введите номер поезда: '
  train_number = gets.chomp
  @trains.find { |train| train.number == train_number }
end

def adjust_car
  cars = @trains.map(&:cars).flatten
  puts "Доступные вагоны: #{cars.map(&:number).join(', ')}"
  print 'Введите номер вагона: '
  car_number = gets.chomp
  car = cars.find { |car| car.number == car_number.to_i }
  if car.is_a? PassengerCar
    book_seat car
  else
    load_car car
  end
end

def book_seat(car)
  car.take_seat
  print 'Место зарезервировано!'
  gets
end

def load_car(car)
  print 'Введите кол-во занимаемого объема: '
  load_amount = gets.chomp
  car.load_car load_amount
rescue Exception => e
  puts e.message
  retry
end

def start
  loop do
    system 'cls'
    render_menu
    print 'Выбор: '
    choice = gets.chomp
    action choice
  end
end

def action(choice)
  case choice
  when '1'
    create_train
  when '2'
    create_route
  when '3'
    assign_route
  when '4'
    add_car
  when '5'
    unhook_car
  when '6'
    move_train
  when '7'
    get_stations_and_trains
  when '8'
    adjust_car
  when '9'
    exit
  end
end

start
