class Player
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def guess(fragment)
    print "#{@name} enter a letter: "
    guess = gets.chomp
    until alert_invalid_guess(guess, fragment)
      puts "Try again: "
      guess = gets.chomp
    end
    guess
  end

  def alert_invalid_guess(guess, fragment)
    ("a".."z").to_a.include?(guess.downcase) && part_of_word?(guess, fragment)
  end

  def part_of_word?(string)
    maybe_fragment = @fragment + string

    dictionary.any? do |word|
      word[0, maybe_fragment.size] == maybe_fragment
    end
  end
end
