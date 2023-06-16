# frozen_string_literal: true

# 5. Заданы три числа, которые обозначают число, месяц, год (запрашиваем у пользователя). Найти порядковый номер даты, начиная отсчет с начала года. Учесть, что год может быть високосным. (Запрещено использовать встроенные в ruby методы для этого вроде Date#yday или Date#leap?)
months = {
  january: 31,
  february: 28,
  march: 31,
  april: 30,
  may: 31,
  june: 30,
  july: 31,
  august: 31,
  september: 30,
  october: 31,
  november: 30,
  december: 31
}

puts 'Determine a date order (tired of changing language while coding so let\'s practice english)'
print 'Enter year: '
year = gets.chomp.to_i

if year.negative?
  puts 'Year cannot be negative! Exit'
  exit
end

print 'Enter month: '
month = gets.chomp.downcase.to_sym

unless months.key?(month)
  puts 'Can\'t find such month. Exit'
  exit
end

print 'Enter day number: '
day = gets.chomp.to_i

unless (1..31).include? day
  puts 'Day should be in [1, 31] interval. Exit'
  exit
end

is_leap = (year % 4).zero? && year % 100 != 0 || (year % 400).zero?
months[:february] = 29 if is_leap

order_number = 0
months.each do |m, d|
  if m == month
    order_number += day
    break
  else
    order_number += d
  end
end

puts "The order number of #{day} #{month} #{year} is #{order_number}"
