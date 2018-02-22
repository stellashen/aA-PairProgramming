require 'set'
require_relative 'player'

class Game
  attr_accessor :fragment, :current_player, :previous_player
  attr_reader :dictionary, :player1, :player2

  def initialize(player1, player2)
    @fragment = ""
    @player1 = player1
    @player2 = player2
    words = File.readlines("dictionary.txt").map(&:chomp)
    @dictionary = Set.new(words)
  end

  def play_round
    @current_player = @player1
    @previous_player = @player2

    until lost?(@fragment)
      take_turn
    end

    puts "The winner is #{@current_player.name}!"
  end

  def lost?(fragment)
    @dictionary.include?(fragment)
  end

  def next_player!
    @current_player, @previous_player = @previous_player, @current_player
  end

  def take_turn
    letter = @current_player.guess(@fragment)
    @fragment += letter
    next_player!
    puts "Fragment is: #{@fragment}"
  end

end
