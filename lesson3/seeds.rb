# frozen_string_literal: true

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

@r1 = Route.new(@s2, @s5)
@r1.add_station @s1
@r1.add_station @s4

@r2 = Route.new(@s7, @s6)
@r2.add_station @s3

@t1 = Train.new(1, :cargo, 12)
@t2 = Train.new(2, :cargo, 25)
@t3 = Train.new(3, :passenger, 8)
@t4 = Train.new(4, :passenger, 12)

@t1.route = @r1
@t2.route = @r1
@t3.route = @r1
