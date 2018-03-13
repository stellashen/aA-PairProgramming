require 'byebug'

class ComputerPlayer
  attr_reader :known_cards
  def initialize
    @known_cards = {}
    @matched_cards = Array.new { Array.new(2) }
  end

  def get_guess(board)
    byebug
    guess = []

    if @known_cards.empty?
      guess << (0..3).to_a.sample
      guess << (0..3).to_a.sample
      receive_revealed_card(guess, board)
    end
    guess
  end

  def receive_revealed_card(guess, board)
    card_val = board[guess].face_value
    @known_cards[guess] = card_val
  end

end
