require_relative 'card'
require 'byebug'

class Board
  DEFAULT_GRID = Array.new(4) { Array.new(4) }
  VALUES = *(1..100)
  attr_reader :grid

  def initialize(grid = DEFAULT_GRID)
    @grid = grid
    populate
  end

  def populate
    num_of_unique_cards = (@grid.length * @grid[0].length) / 2
    cards = get_cards(num_of_unique_cards)
    place_cards(cards)
  end

  def place_cards(cards)
    @grid.each_with_index do |arr, row|
      arr.each_index do |col|
        self[[row, col]] = cards.pop
      end
    end
  end

  def get_cards(num_of_unique_cards)
    card_values = create_deck(num_of_unique_cards).shuffle
    cards = []
    (num_of_unique_cards * 2).times do
      cards << Card.new(card_values.pop)
    end
    cards
  end

  def create_deck(num_of_unique_cards)
    deck = []
    used_vals = []

    num_of_unique_cards.times do
      card_face_value = VALUES.sample
      while used_vals.include?(card_face_value)
        card_face_value = VALUES.sample
      end
      deck << card_face_value
      used_vals << card_face_value
    end
    deck += deck
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @grid[row][col] = value
  end

  def render
    @grid.each_with_index do |row_cards, row_idx|
      row_cards.each_with_index do |card, col_idx|
        card.display_card
        print "  "
      end
      print "\n"
    end
  end

  def reveal(guessed_pos)
    position = guessed_pos
    self[position].reveal
    position
  end

  def won?
    #check if everything is face up
    @grid.each do |row_cards|
      row_cards.each do |card|
        return false if card.face_up == false
      end
    end
    true
  end

end
