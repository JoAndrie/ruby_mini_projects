def substrings(text, dictionary)
  result = Hash.new(0)

  dictionary.each do |word|
    matches = text.downcase.scan(word.downcase).length

    result[word] = matches if matches > 0
  end
    result
end

dictionary = ["below", "down", "go", "going", "horn", "how", "howdy", "it", "i", "low", "own", "part", "partner", "sit"]

puts "Test single words: "
p substrings("below", dictionary)

puts "\nTest multiple words: "
p substrings("Howdy partner, sit down! How's it going?", dictionary)