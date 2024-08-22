module Enumerable
  # Your code goes here
  def my_each_with_index
    for i in 0...self.size
      yield self[i], i
    end
    self
  end

  def my_select
    new_arr = []
    self.my_each do |elem|
      new_arr << elem if yield(elem)
    end
    new_arr
  end

  def my_all?
    self.my_each do |elem|
      return false unless yield(elem)
    end
    true
  end

  def my_any?
    self.my_each do |elem|
      return true if yield(elem)
    end
    false
  end

  def my_none?
    self.my_each do |elem|
      return false if yield(elem)
    end
    true
  end

  def my_count
    count = 0
    if block_given?
      self.my_each do |elem|
        count += 1 if yield(elem)
      end
      return count
    end
    self.size
  end

  def my_map
    new_arr = []

    self.my_each do |elem|
      new_arr << yield(elem)
    end
    new_arr
  end

  def my_inject(initial=self.first)
    accumlator = initial
    self.my_each do |elem|
      accumlator = yield(accumlator, elem)
    end
    accumlator
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for i in 0...self.size
      yield self[i]
    end
    self
  end
end
