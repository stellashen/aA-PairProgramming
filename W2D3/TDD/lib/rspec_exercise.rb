class Array

  def my_unique
    raise "Please enter an array" unless self.is_a?(Array)
    return self if self.length <= 1
    result = []
    self.each do |elem|
      result << elem unless result.include?(elem)
    end
    result
  end

  def two_sum
    res = []

    i = 0
    while i < self.length
      j = i + 1
      while j < self.length
        res << [i, j] if self[i] + self[j] == 0 
        j += 1
      end
      i += 1
    end
    res
  end

















end
