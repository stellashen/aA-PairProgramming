class TowersOfHanoi

  attr_accessor :towers

  def initialize(towers = [[3, 2, 1],[],[]])
    @towers = towers

  end

  def move

  end

  def play

  end

  def take_turn

    puts "Please choose a pile to move from and one to move to :)"
    gets.chomp

  end

  def won?

  end
end
