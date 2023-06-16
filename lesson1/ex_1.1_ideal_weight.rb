# frozen_string_literal: true

puts 'Здравствуйте! Посчитаем идеальный вес для Вас'
print 'Как Вас зовут? '
name = gets.chomp

print 'Какой у Вас рост? '
height = gets.chomp.to_i

weight = (height - 110) * 1.15

if weight.positive?
  puts "#{name}, Ваш идеальный вес - #{weight} кг"
else
  puts 'Ваш вес уже оптимальный'
end
