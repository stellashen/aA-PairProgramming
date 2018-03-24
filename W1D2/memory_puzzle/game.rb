require_relative 'board'
require_relative 'card'
require_relative 'human_player'
require_relative 'computer_player'

class Game
  attr_accessor :board
  
  def initialize(player)
    @board = Board.new
    @player = player
  end

  def play
    @board.render
    until @board.won?
      flip_card
    end
    puts "You won, #{@player.name}!"
  end

  def flip_card
    guessed_pos = @player.get_guess(@board)
    prev_guessed_pos = @board.reveal(guessed_pos)
    @board.render
    guessed_pos = @player.get_guess(@board)
    current_guessed_pos = @board.reveal(guessed_pos)
    @board.render

    unless match?(current_guessed_pos, prev_guessed_pos)
      @board[prev_guessed_pos].hide
      @board[current_guessed_pos].hide
    end
  end

  def match?(current_guessed_pos, prev_guessed_pos)
    @board[current_guessed_pos] == @board[prev_guessed_pos]
  end

end
