puts 'Определитель типа треугольника 2000'
print 'Введите сторону А: '
a = gets.chomp.to_i
print 'Введите сторону B: '
b = gets.chomp.to_i
print 'Введите сторону C: '
c = gets.chomp.to_i

unless a > 0 && b > 0 && c > 0
  puts 'Стороны должны быть положительными значениями!'
  exit
end

unless a + b > c && a + c > b && b + c > a
  puts 'Невозможно построить треугольник с заданными сторонами'
  exit
end

max, c1, c2 =
  if a > b && a > c
    [a, b, c]
  elsif b > c && b > a
    [b, a, c]
  else
    [c, a, b]
  end

if max ** 2 == c1 ** 2 + c2 ** 2
  puts 'Треугольник прямоугольный'
elsif a == b && b == c
  puts 'Треугольник равносторонний и равнобедренный'
elsif a == b || b == c
  puts 'Треугольник равнобедренный'
else
  puts 'Треугольник вполне себе обычный'
end
  
