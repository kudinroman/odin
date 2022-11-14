# stock picker

puts 'stock_picker([17,3,6,9,15,8,6,1,10]) =>'
puts '====> [1,4]  # for a profit of $15 - $3 == $12'
puts

prices = [17,3,6,9,15,8,6,1,10]

def stock_picker(numbers_arr)
    max = numbers_arr.drop(1).max
    puts 'Max: ' + max.to_s
    max_index = numbers_arr.index(max)
    puts 'Max index: ' + max_index.to_s
    min = numbers_arr.take(max_index).min
    puts 'Min: ' + min.to_s
    min_index = numbers_arr.index(min)
    puts 'Min index: ' + min_index.to_s
    [min_index, max_index]
end

puts stock_picker(prices).to_s
