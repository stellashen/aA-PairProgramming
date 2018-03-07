require 'byebug'

class HumanPlayer
  def initialize(name = "John")
    @name = name
  end

  def get_guess(board)
    puts "please enter a position:
      (e.g. enter 1,2 to access row 1, col 2)"
    guess = gets.chomp

    until valid_guess?(guess)
      puts "Try again: "
      guess = gets.chomp
    end

    guess.split(",").map(&:to_i)
  end

  def valid_guess?(guess)
    valid_nums = ["0", "1", "2", "3"]
    guess.length == 3 && valid_nums.include?(guess[0]) &&
      guess[1] == "," && valid_nums.include?(guess[2])
  end
end
