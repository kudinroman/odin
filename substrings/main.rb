# substrings

puts 'dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]'
puts
puts 'substrings("below", dictionary) =>'
puts '====> { "below" => 1, "low" => 1 }'
puts
puts 'substrings("belowhowdititii", dictionary) =>'
puts '====> {"below"=>1, "how"=>1, "it"=>2, "i"=>4, "low"=>1}'
puts
puts 'substrings("Howdy partner, sit down! How\'s it going?", dictionary) =>'
puts '====> {"down"=>1, "go"=>1, "going"=>1, "how"=>2, "howdy"=>1, "it"=>2, "i"=>3, "own"=>1, "part"=>1, "partner"=>1, "sit"=>1}'
puts

@result = Hash.new(0)
dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def substrings(text, dict)
    dict.each { |substr| check_word(substr, text) }
end

def check_word(substr, text)
    if text.downcase.include? substr
        @result[substr] = text.downcase.scan(/(?=#{substr})/).count
    end
end

print 'Enter you text: '
text = gets.chomp
substrings(text, dictionary)
puts @result.to_s