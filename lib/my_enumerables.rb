module Enumerable
  # Your code goes here
  def my_all?
    my_each { |elem| return false unless yield(elem) }
    true
  end

  def my_any?
    my_each { |elem| return true if yield(elem) }
    false
  end

  def my_none?
    my_each { |elem| return false if yield(elem) }
    true
  end

  def my_select
    results = []
    my_each { |elem| results << elem if yield(elem) }
    results
  end

  def my_map
    results = []
    my_each { |elem| results << yield(elem) }
    results
  end

  def my_count
    results = []
    if block_given?
      my_each { |elem| results << elem if yield(elem)}
    else
      my_each { |elem| results << elem }
    end
    results.size
  end

  def my_inject(initial = nil)
    accumulator = initial || self[0]
    index = initial ? 0 : 1
    while index < self.size
      accumulator = yield(accumulator, self[index])
      index += 1
    end
    accumulator
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each(&block)
    each { |elem| block.call(elem) }
  end

  def my_each_with_index(&block)
    each_with_index { |elem, index| block.call(elem, index) }
  end
end
