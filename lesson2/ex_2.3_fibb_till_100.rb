# frozen_string_literal: true

# 3. Заполнить массив числами фибоначчи до 100
arr = []
first_num = 0
second_num = 1
loop do
  arr.push first_num
  first_num, second_num = second_num, first_num + second_num
  break if first_num >= 100
end
puts arr
