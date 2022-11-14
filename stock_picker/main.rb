# stock picker

puts 'stock_picker([17,3,6,9,15,8,6,1,10]) =>'
puts '====> [1,4]  # for a profit of $15 - $3 == $12'
puts

prices = [17,3,6,9,15,8,6,1,10]

def stock_picker(numbers)
    res = arr
        .repeated_combination(2)
        .to_a
        .max { |a, b| a[1] - a[0] <=> b[1] - b[0] }

    "[#{arr.index(result[0])}:#{arr.index(result[1])}]"
end

puts stock_picker(prices)