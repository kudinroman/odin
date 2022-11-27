def double_vision
    yield
    yield
  end
  
  def method(number)
    puts "My number is: #{number}"
  end
  
  double_vision { (1..3).each { |n| method(n) } }