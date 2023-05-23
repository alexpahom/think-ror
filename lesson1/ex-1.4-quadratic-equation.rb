puts 'Определяем корни квадретного уравнения'
print 'Введите коэффициент А: '
a = gets.chomp.to_i
print 'Введите коэффициент B: '
b = gets.chomp.to_i
print 'Введите коэффициент C: '
c = gets.chomp.to_i

d = b ** 2 - 4 * a * c

if d < 0
  puts "Дискриминант: #{d}, корней нет"
elsif d == 0
  x = -1 * b / 2 * a
  puts "Дискриминант: #{d}, корень: #{x}"
else
  x1 = -1 * b + Math.sqrt(d) / 2 * a
  x2 = -1 * b - Math.sqrt(d) / 2 * a
  puts "Дискриминант: #{d}, корни: #{x1}, #{x2}"
end
  
