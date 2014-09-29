# Good place to show how easy is monkey patching in Ruby.
# Show students that they can extend Array class by sum method.
#
# class Array
#   def sum
#      self.reduce(0,:+)
#   end
# end
#
# [].sum => 0

def sum arr
  # total = 0
  # arr.each do |x|
  #   total += x
  # end
  # return total
  # [].reduce(:+) will give nil not 0, here it should be arr.reduce(0,:+) to return 0
  arr.reduce(:+)
end

def max_2_sum arr
  sum(arr.sort[-2..-1])
end

def sum_to_n? arr, n
  arr.permutation(2).any? do |pair|
    sum(pair) == n
  end
end
