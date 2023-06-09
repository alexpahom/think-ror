# frozen_string_literal: true

# 4. Заполнить хеш гласными буквами, где значением будет являтся порядковый номер буквы в алфавите (a - 1).

alphabet = ('a'..'z').to_a
vowels = {}
alphabet.each_with_index do |letter, index|
  vowels[letter] = index + 1 if 'aeiouy'.include? letter
end

puts vowels
