require_relative 'route'
require_relative 'train'
require_relative 'station'

@s1 = Station.new 'Minsk'
@s2 = Station.new 'Moskow'
@s3 = Station.new 'New Orlean'
@s4 = Station.new 'Paris'
@s5 = Station.new 'Hamburg'
@s6 = Station.new 'California'
@s7 = Station.new 'Washington D.C.'

@r1 = Route.new(start_station: @s2, end_station: @s5)
@r1.add_station @s1
@r1.add_station @s4

@r2 = Route.new(start_station: @s7, end_station: @s6)
@r2.add_station @s3

@t1 = Train.new(id: 1, type: :cargo, cars_number: 12)
@t2 = Train.new(id: 2, type: :cargo, cars_number: 25)
@t3 = Train.new(id: 3, type: :pass, cars_number: 8)
@t4 = Train.new(id: 4, type: :pass, cars_number: 12)

@t1.route = @r1
@t2.route = @r1
@t3.route = @r1
