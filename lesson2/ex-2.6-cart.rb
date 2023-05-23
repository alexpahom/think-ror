# 6. Сумма покупок. Пользователь вводит поочередно название товара, цену за 
# единицу и кол-во купленного товара (может быть нецелым числом). 
# Пользователь может ввести произвольное кол-во товаров до тех пор, пока не 
# введет "стоп" в качестве названия товара. На основе введенных данных 
# требуетеся:
# Заполнить и вывести на экран хеш, ключами которого являются названия 
# товаров, а значением - вложенный хеш, содержащий цену за единицу товара и 
# кол-во купленного товара. Также вывести итоговую сумму за каждый товар.
# Вычислить и вывести на экран итоговую сумму всех покупок в "корзине".
cart = {}
puts 'Открылся новый магазин! Что берем?'
loop do
  print 'Название товара: '
  name = gets.chomp.downcase
  if name == 'стоп'
    puts 'Считаем итог'
    break
  end
  print 'Цена за единицу товара: '
  price = gets.chomp.to_f
  print 'Кол-во товара: '
  qnt = gets.chomp.to_f
  init_quantity = 
    cart.has_key?(name) ? cart[name][:quantity] : 0
  cart[name] = { price: price, quantity: init_quantity + qnt }
end

print "#{'Товар'.ljust(10)}"
print "#{'Цена\\ед'.rjust(8)}"
print "#{'Кол-во'.rjust(8)}"
puts "#{'Сумма'.rjust(10)}"
total = 0
cart.each do |k, v|
  print k.ljust(10)
  print v[:price].to_s.rjust(8)
  print v[:quantity].to_s.rjust(8)
  total += v[:price] * v[:quantity]
  puts (v[:price] * v[:quantity]).to_s.rjust(10)
end
puts "Итого: #{total}".rjust(36)
