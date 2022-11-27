module Enumerable
  # Your code goes here
  def my_all?
    i = 0
    while i < self.length
      if !(yield self[i])
        return false
      end
      i += 1
    end
    return true
  end

  def my_any?
    i = 0
    while i < self.length
      if yield self[i]
        return true
      end
      i += 1
    end
    return false
  end

  def my_count
    if !block_given?
      return self.length
    else
      count = 0
      i = 0
      while i < self.length
        if (yield self[i])
          count += 1
        end
        i += 1
      end
      return count
    end
  end

  def my_each_with_index
    i = 0
    while i < self.length
      yield(self[i], i)
      i += 1
    end
    self
  end

  def my_inject(initial_value)
    product = initial_value
    i = 0
    while i < self.length
      product = yield(product, self[i])
      i += 1
    end
    product
  end

  def my_map
    new_arr = []
    i = 0
    while i < self.length
      new_arr[i] = yield self[i]
      i += 1
    end
    new_arr
  end

  def my_none?
    i = 0
    while i < self.length
      if yield self[i]
        return false
      end
      i += 1
    end
    return true
  end

  def my_select
    new_arr = []
    i = 0
    while i < self.length
      if yield self[i]
        new_arr.push self[i]
      end
      i += 1
    end
    new_arr
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  extend Enumerable

  def my_each
    i = 0
    while i < self.length
      yield self[i]
      i += 1
    end
    self
  end
end
