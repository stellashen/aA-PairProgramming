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

  # assumption: input is square matrices
  def my_transpose
    result = Array.new(length) { Array.new(length) }
    self.each_with_index do |row, r|
      row.each_with_index do |num, c|
        result[r][c] = self[c][r]
      end
    end
    result
  end

  def stock_picker
    res = []
    max_profit = 0
    i = 0
    while i < length
      j = i + 1
      while j < length
        profit = self[j] - self[i]
        if profit > max_profit
          res << [i, j]
          max_profit = self[j] - self[i]
        end
        j += 1
      end
      i += 1
    end

    res.last
  end














end
