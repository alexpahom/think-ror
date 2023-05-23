puts 'Сегодня считаем площадь треугольника!'
print 'Введите длину основания: '
base = gets.chomp.to_i

print 'Введите длину высоты: '
height = gets.chomp.to_i

s = 0.5 * base * height

if s > 0
  puts "Площадь треугольника - #{s}"
else
  puts 'Основание и/или высота не может быть отрицательным значением!'
end
