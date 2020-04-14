puts "---------"
puts "my_each"
puts "--------"

puts [1, 2, 3].my_each { |elem| print "#{elem + 1} "} # => 2 3 4
puts (1..5).my_each { |elem| print "#{elem + 1} "} # => 2 3 4 5 6

puts "---------"
puts "my_each_with_index?"
puts "--------"
puts [5, 7, 0, 1, 2, 3].my_each_with_index { |elem, idx| puts "#{elem} : #{idx}" }

puts "---------"
puts "my_select"
puts "---------"
p [1,2,3,8].my_select { |n| n.even? } # => [2, 8]
p [0, 2018, 1994, -7].my_select { |n| n > 0 } # => [2018, 1994]
p [6, 11, 13].my_select(&:odd?) # => [11, 13]
puts

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

puts "------"
puts "my_map"
puts "------"

p [1,2,3].my_map { |n| 2 * n } # => [2,4,6]
p ["Hey", "Jude"].my_map { |word| word + "?" } # => ["Hey?", "Jude?"]
p [false, true].my_map { |bool| !bool } # => [true, false]
  my_proc = Proc.new {|num| num > 10 }
p [18, 22, 5, 6].my_map(my_proc) {|num| num < 10 } # => true true false false

puts "------"
puts "my_inject"
puts "------"
p [1,2,3,4].my_inject(10) { |accum, elem| accum + elem} # => 20
p [1,2,3,4].my_inject { |accum, elem| accum + elem} # => 10
p [5, 1, 2].my_inject("+") # => 8
p (5..10).my_inject(2, :*) # => 302400
p (5..10).my_inject(4) {|prod, n| prod * n} # => 604800
p [2,4,5].my_inject(1,:*) # => 40

puts "------"
puts "multiply_els"
puts "------"
p multiply_els([2,4,5]) #=> 40