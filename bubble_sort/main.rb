# bubble sort

puts 'bubble_sort([4,3,78,2,0,2]) => [0,2,2,3,4,78]'
puts

array = [6,5,4,3,2,1]
puts 'Initial array: ' + array.to_s

def bubble_sort(arr)
    temp = 0
    arr.each_index do |i|
        for index in 0..(arr.length - 2 - i)
            diff = arr[index] <=> arr[index + 1]

            if diff == 1
                temp = arr[index]
                arr[index] = arr[index + 1]
                arr[index + 1] = temp
            end

            puts arr.to_s
            sleep 0.5
        end
    end

    arr
end

new_array = bubble_sort(array)
puts 'Result: ' + new_array.to_s