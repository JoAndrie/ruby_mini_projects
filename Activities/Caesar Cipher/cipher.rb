def caesar_cipher(string, shift)
  string.tr('A-Za-z', ('A'..'Z').to_a.rotate(shift).join + ('a'..'z').to_a.rotate(shift).join)
end

puts caesar_cipher("What a string!", 5)