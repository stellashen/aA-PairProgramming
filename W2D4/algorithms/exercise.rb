require 'byebug'

# time O(n^2)
def my_min_p1(arr)
  arr.each do |el1|
    is_min = true
    arr.each do |el2|
      is_min = false if el1 > el2
    end
    return el1 if is_min
  end
end

# time O(n)
def my_min_p2(arr)
  min = arr[0]
  arr.each do |el|
    min = el if min > el
  end
  min
end

# time O(n^3)
def largest_subsum_p1(arr)
  max_sum = nil
  arr.length.times do |start_idx|
    end_idx = start_idx

    while end_idx < arr.length
      new_arr = arr[start_idx..end_idx]
      sum = calculate(new_arr)
      if max_sum == nil || max_sum < sum
        max_sum = sum
      end
      end_idx += 1
    end
  end

  max_sum
end

def calculate(arr)
  arr.reduce(&:+)
end

# O(n) time with O(1) memory
def largest_subsum_p2(arr)
  max_sum = 0
  arr.each do |el|
    temp = max_sum + el
    temp = 0 if temp < 0
    max_sum = temp if temp > max_sum
  end

  if max_sum == 0
    # all the nums are negative
    max_sum = arr[0]
    arr.each do |el|
      max_sum = el if el > max_sum
    end
  end

  max_sum
end

# time O(n!)
def first_anagram?(word1, word2)
  return false if word1.length != word.length
  perms = word1.chars.permutation.to_a
  perms.each do |el|
    return true if el.join == word2
  end
  false
end

=begin
worst case time O(n^3)
word1.chars.length is getting smaller, so two each loops' time is:
n + (n-1) + (n-2) + ... + 3 + 2 + 1 = n^2

the total time for delete_char is n + n-1 + n-2 +...+3+2+1 = n^2
We run the delete_char method for n times at most,
because if char1 == char2 will only be met for n times.

total time = O(n^2 + n^2) = O(n^2)
=end
def second_anagram?(word1, word2)
  return false if word1.length != word2.length
  word1.chars.each do |char1|
    word2.chars.each do |char2|
      if char1 == char2
        word1 = delete_char(word1, char1)
        word2 = delete_char(word2, char1)
      end
    end
  end

  word1.empty? && word2.empty?
end

def delete_char(word, char)
  idx = word.index(char)
  word[0...idx] + word[(idx + 1)..-1]
end

# time O(n * logn)
def third_anagram?(word1, word2)
  word1.chars.sort == word2.chars.sort
end

# time O(n), space O(1)
def fourth_anagram?(word1, word2)
  hash1 = Hash.new { |h, k| h[k] = 0 }
  hash2 = Hash.new { |h, k| h[k] = 0 }
  word1.chars.each do |char|
    hash1[char] += 1
  end
  word2.chars.each do |char|
    hash2[char] += 1
  end
  hash1 == hash2
end

# use only one hash, time O(n), space O(1)
def fourth_anagram2?(word1, word2)
  hash = Hash.new { |h, k| h[k] = 0 }
  word1.chars.each do |char|
    hash[char] += 1
  end
  word2.chars.each do |char|
    hash[char] -= 1
  end
  hash.keys.all? { |v| v == 0 }
end
