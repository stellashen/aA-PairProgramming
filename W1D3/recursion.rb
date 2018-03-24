require 'byebug'

def range(start, finish)
  return [] if finish <= start
  range(start, finish - 1) << finish - 1
end

def sum_iter(arr)
  sum = 0
  arr.each { |num| sum += num }
  sum
end

def sum_rec(arr)
  return 0 if arr.empty?
  arr.first + sum_rec(arr.drop(1))
end

def exp1(b, n)
  return 1 if n == 0
  exp1(b, n - 1) * b
end

def exp2(b, n)
  return 1 if n == 0

  half = exp2(b, n / 2)

  n.even? ? half * half : b * half * half
  # note to self: don't forget ? for ternary operator
end

# this works, but not the most elegant solution:
# def deep_dup(arr)
#   return arr unless arr.is_a?(Array)
#   res_arr = []
#   arr.each { |el| res_arr << deep_dup(el) }
#   res_arr
# end

def deep_dup
  new_arr = []
  self.each do |el|
    new_arr << (el.is_a?(Array) ? el.deep_dup : el)
  end
  new_arr
end

# more simplified deep dup code:
def dd_map
  map { |el| el.is_a?(Array) ? el.dd_map : el }
end

def fib_num_iter(num)
  return [] if num < 1
  return [0] if num == 1
  result = [0, 1]
  count_fibs = 2
  while count_fibs < num
    result << result[-1] + result[-2]
    count_fibs += 1
  end
  result
end

def fib_num(num)
  return [] if num == 0
  return [0] if num == 1
  return [0, 1] if num == 2
  prev_arr = fib_num(num - 1)
  new_num = prev_arr[-1] + prev_arr[-2]
  prev_arr << new_num
end

def subsets(arr)
  return [[]] if arr.empty?
  if arr.length == 1
    prev = [[]]
  else
    prev = subsets(arr[0...-1])
  end

  last_val = arr[-1]

  result_arr = []
  # result_arr = deep_dup(prev)

  prev.each do |array|
    # new_arr = deep_dup(array)
    # new_arr << last_val
    result_arr << array + [last_val]
  end
  prev + result_arr
end

def permutation(arr)
  #byebug
  return [[]] if arr.empty?
  if arr.length > 1
    prev = permutation(arr[0...-1])
  else
    prev = [[]]
  end

  last_val = arr[-1]
  result_arr = []

  prev.each do |array|
    result_arr += add_new_val(array, last_val)
  end

  result_arr
end

# helper method for permutation
def add_new_val(array, last_val)
  result = []

  array.each_index do |idx|
    result << array[0...idx] + [last_val] + array[idx..-1]
  end

  result << array + [last_val]
end

def bsearch(array, target)
  return nil if array == nil || array.empty?
  bsearch_helper(array, target, 0, array.length - 1)
end

def bsearch_helper(array, target, left, right)
  # debugger
  if left >= right
    if array[left] == target
      return left
    else
      return nil
    end
  end

  mid = left + (right - left) / 2

  if array[mid] == target
    return mid
  elsif array[mid] < target
    bsearch_helper(array, target, mid + 1, right)
  else
    bsearch_helper(array, target, left, mid - 1)
  end
end

def merge_sort(array)
  return array if array.length <= 1
  mid = array.count / 2
  left = merge_sort(array.take(mid))
  right = merge_sort(array.drop(mid))
  Array.merge(left, right)
end

class Array
  def self.merge(left, right)
    merged = []
    until left.empty? || right.empty?
      if left.first <= right.first
        merged << left.shift
      else
        merged << right.shift
      end
    end
    merged.concat(left).concat(right)
  end
end

def make_better_change(value, coins)
  return [] if value == 0
  return nil if coins.none? { |coin| coin <= value}

  coins = coins.sort.reverse
  best_solution = nil

  coins.each_with_index do |coin, used|
    next if coin > value
    remainder = value - coin
    best_remainder = make_better_change(remainder, coins.drop(used))
    next if best_remainder.nil?
    this_solution = [coin] + best_remainder
    if best_solution.nil? || this_solution.count < best_solution.count
      best_solution = this_solution
    end
  end

  best_solution
end
