module Enumerable

  def my_each
    # if block_given do
      i = 0
      while i < self.length do
        yield(self[i])
        i += 1
      end

    # end
    return to_enum(:my_each) unless block_given?
  end
  
  
  def my_each_with_index
    i = 0
    # if block_given do
    while i < self.length do
      yield(self[i], i)
      i += 1
    end
    # else
    return to_enum(:my_each_with_index) unless block_given?
    # end
    
  end
  
end

puts [1, 2, 3].my_each { |elem| print "#{elem + 1} "} # => 2 3 4

puts '------'

puts [5, 7, 0, 1, 2, 3].my_each_with_index { |elem, idx| puts "#{elem} : #{idx}" }

