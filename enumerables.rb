module Enumerable

  # my_each
  
  def my_each
    return to_enum(:my_each) unless block_given?
      i = 0
      while i < self.length do
        yield(self[i])
        i += 1
      end

  end
  
  # my_each_with_index
  
  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?
    i = 0
    while i < self.length do
      yield(i,self[i])
      i += 1
    end
    
  end

  # my_select

  def my_select
    return to_enum(:my_select) unless block_given?
    
    arr = []
    i = 0
    while i < self.length do
      arr << self[i] if yield(self[i])
      i += 1
    end
    arr
  end
  
 # my all

 def my_all?

  unless block_given?
    i = 0
    while i < self.length do
      return false unless self[i]
      i += 1
    end
    return true
  end

  bool = true
  i = 0
  while i < self.length do
    bool = false unless yield(self[i]) 
    i += 1
  end
  bool
 end

end

puts [1, 2, 3].my_each { |elem| print "#{elem + 1} "} # => 2 3 4

puts "---------"

puts [5, 7, 0, 1, 2, 3].my_each_with_index { |elem, idx| puts "#{elem} : #{idx}" }

puts "---------"

p [-8, -9, -6].my_all? { |n| n < 0 } # => true
p [3, 5, 8, 11].my_all? { |n| n.odd? } # => false
p [-8, -9, -6, 0].my_all? { |n| n < 0 } # => false
p [-8, -9, -6, 0].my_all? # => true
p [-8, -9, -6, nil].my_all? # => false
p [-8, -9, -6, false].my_all? # => false

puts "---------"

