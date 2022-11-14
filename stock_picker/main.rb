# stock picker

puts 'stock_picker([17,3,6,9,15,8,6,1,10]) =>'
puts '====> [1,4]  # for a profit of $15 - $3 == $12'
puts

prices = [17,3,6,9,15,8,6,1,10]

def stock_picker(numbers)
    buy = 0
    sell = 0
    numbers.each_index do |i|
        first = numbers[i]
        for index in (i)..(numbers.length - 1)
            second = numbers[index]
            # puts "[#{first} - #{second}]"
            if first < second && diff(first, second) > diff(buy, sell)
                buy = first
                sell = second
                # puts "New values: [#{buy} - #{sell}]"
            end
        end
    end

    "[#{numbers.index(buy)}:#{numbers.index(sell)}]"
end

def diff(buy, sell)
    sell - buy
end

puts stock_picker(prices)
