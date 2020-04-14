# rubocop:disable Style/CaseEquality, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity

module Enumerable
  # my_each
  def my_each
    return to_enum(:my_each) unless block_given?

    i = 0
    while i < size
      yield(to_a[i])
      i += 1
    end
  end

  # my_each_with_index

  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    i = 0
    while i < length
      yield(self[i], i)
      i += 1
    end
  end

  # my_select

  def my_select
    return to_enum(:my_select) unless block_given?

    arr = []
    i = 0
    while i < length
      arr << self[i] if yield(self[i])
      i += 1
    end
    arr
  end

  # my all

  def my_all?(aaa = nil)
    if aaa

      my_each { |elem| return false unless aaa === elem }

    end
    unless block_given?
      i = 0
      while i < length
        return false unless self[i]

        i += 1
      end
      return true
    end
    bool = true
    i = 0
    while i < length
      bool = false unless yield(self[i])
      i += 1
    end
    bool
  end

  # my any

  def my_any?(aaa = nil)
    if aaa

      my_each { |elem| return true if aaa === elem }
    end
    unless block_given?
      # p 'allalou'
      i = 0
      while i < length
        return true unless self[i]

        i += 1
      end
      return false
    end
    # p 'abderrahmane'
    bool = false
    i = 0
    while i < length
      bool = true if yield(self[i])
      i += 1
    end
    bool
  end

  # my none?

  def my_none?(aaa = nil, &prc)
    !my_any?(aaa, &prc) if aaa
    unless block_given?
      i = 0
      while i < length
        return false unless self[i]

        i += 1
      end
      return true
    end
    bool = true
    i = 0
    while i < length
      bool = false if yield(self[i])
      i += 1
    end
    bool
  end

  def my_count(arg = nil)
    return length if arg.nil? && !block_given?

    counter = 0
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
    counter
  end

  # my_map

  def my_map(prc = nil)
    return to_enum(:my_map) unless block_given? || !prc.nil?

    arr = []
    if block_given? and prc.nil?
      my_each { |n| arr << yield(n) }
      arr
    elsif !prc.nil?
      my_each { |n| arr << prc.call(n) }
      arr
    end
  end

  # my_inject

  def my_inject(init = nil, sym = nil)
    if block_given?
      if !init.nil?
        num = init
        my_each { |elem| num = yield(num, elem) }
      else
        num = first
        to_a[1..-1].my_each { |elem| num = yield(num, elem) }
      end
    elsif !sym.nil?
      num = init
      my_each { |elem| num = num.send(sym, elem) }
    elsif !init.nil?
      num = first
      to_a[1..-1].my_each { |elem| num = num.send(init, elem) }
    end
    num
  end
end

# rubocop:enable Style/CaseEquality, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity

# multiply_els

def multiply_els(arr)
  arr.my_inject(:*)
end
