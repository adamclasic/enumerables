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

  def my_any?

    unless block_given?
      i = 0
      while i < self.length do
        return true unless self[i]
        i += 1
      end
      return false
    end
    bool = false
    i = 0
    while i < self.length do
      bool = true if yield(self[i]) 
      i += 1
    end
    bool

  end

  def my_none?

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
      bool = false if yield(self[i]) 
      i += 1
    end
    bool

  end

  def my_count(arg=nil)
    return self.length if arg==nil && !block_given?
    counter = 0
    i = 0
    if block_given?
      my_each do |n|
        counter += 1 if yield(n) || arg == n
      end
    end

    if arg
      my_each do |n|
        counter += 1 if arg == n
      end
    end
    return counter
  end


  def my_count1(param = nil)
    counter = 0
    return length if param.nil? && !block_given?

    my_each do |i|
      condition = yield(i) if block_given?
      counter += 1 if condition || i == param
    end
    counter
  end

    # my_map

  def my_map(prc=nil)
    return to_enum(:my_map) unless block_given?
    
    arr = []
    i = 0
    while i < self.length do
      arr << self[i] if yield(self[i])
      i += 1
    end
    arr
  end

end
puts "---------"
puts "my_each"
puts "--------"

puts [1, 2, 3].my_each { |elem| print "#{elem + 1} "} # => 2 3 4

puts "---------"
puts "my_each_with_index?"
puts "--------"

puts [5, 7, 0, 1, 2, 3].my_each_with_index { |elem, idx| puts "#{elem} : #{idx}" }

puts "---------"
puts "my_all?"
puts "--------"

p [-8, -9, -6].my_all? { |n| n < 0 } # => true
p [3, 5, 8, 11].my_all? { |n| n.odd? } # => false
p [-8, -9, -6, 0].my_all? { |n| n < 0 } # => false
p [-8, -9, -6, 0].my_all? # => true
p [-8, -9, -6, nil].my_all? # => false
p [-8, -9, -6, false].my_all? # => false
p [].my_all? # => true

puts "---------"
puts "my_any?"
puts "--------"

p [-8, -9, -6].my_any? { |n| n < 0 } # => true
p [3, 5, 8, 11].my_any? { |n| n.odd? } # => true
p [-8, -9, -6, 0].my_any? { |n| n < 0 } # => true
p [-8, -9, -6, 0].my_any? # => false
p [-8, -9, -6, nil].my_any? # => true
p [-8, -9, -6, false].my_any? # => ture
p [].my_any? # => false

puts "---------"
puts "my_none?"
puts "--------"
p [-8, -9, -6].my_none? { |n| n < 0 } # => false
p [3, 5, 8, 11].my_none? { |n| n.odd? } # => false
p [-8, -9, -6, 0].my_none? { |n| n < 0 } # => false
p [-8, -9, -6, 0].my_none? # => true
p [-8, -9, -6, nil].my_none? # => false
p [-8, -9, -6, false].my_none? # => false
p [].my_none? # => true

puts "---------"
puts "my_count"
puts "--------"
p [1,4,3,8].my_count { |n| n.even? } # => 2
p ["DANIEL", "JIA", "KRITI", "dave"].my_count { |s| s == s.upcase } # => 3
p ["daniel", "jia", "kriti", "dave"].my_count { |s| s == s.upcase } # => 0
p [1,2,3].my_count # => 3
p [1,1,1,2,3].my_count(1) # => 3

