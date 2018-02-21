require_relative 'piece'
require "byebug"

class Board

  attr_accessor :rows

  def initialize
    @sentinel = NullPiece.instance
    @rows = Array.new(8) { Array.new(8) { @sentinel } }
    populate
  end

  def populate
    [:black, :white].each do |color|
      fill_top_bottom_rows(color)
      fill_pawn_rows(color)
    end
    fill_sentinels
  end

  def fill_top_bottom_rows(color)
    pieces = [ Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook ]
    # pieces = [ "R", "K", "B", "Q", "Z", "B", "K", "R"]
    if color == :black
      row = 0
    elsif color == :white
      row = 7
    end

    pieces.each_with_index do |piece, col|
      @rows[row][col] = piece.new(color, self, [row, col])
    end
  end

  def fill_pawn_rows(color)
    if color == :black
      row = 1
    elsif color == :white
      row = 6
    end

    8.times do |col|
      @rows[row][col] = Pawn.new(color, self, [row, col])
    end
  end

  def fill_sentinels
    (2..5).each do |row|
      8.times do |col|
        @rows[row][col] = @sentinel
      end
    end
  end

  def [](pos)
    row, col = pos
    @rows[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @rows[row][col] = val
  end

  #temporary until we have game.rb
  def render
    @display = Display.new(self)
  end

  def move_piece(color, start_pos, end_pos)
    # if piece color is not the right turn color
    # if piece.color != color
    #   raise 'Please move your own piece!'
    #
    curr_piece = self[start_pos]
    moves_arr = curr_piece.moves(curr_piece.move_dirs)

    unless moves_arr.include?(end_pos)
      raise 'You can\'t move here.'
    end

    move_piece!(color, start_pos, end_pos)
  end

  def move_piece!(color, start_pos, end_pos)
    # exchange two objects
    # piece.pos is end_pos

    self[end_pos], self[start_pos] = self[start_pos], self[end_pos]
    self[end_pos].pos = end_pos

    self[start_pos] = @sentinel
  end

  def valid_pos?(pos)
    # piece is within the board ([0,0], [7,7])
    row, col = pos
    return false unless row.between?(0, 7) && col.between?(0, 7)
    true
  end

  def add_piece(piece, pos)

  end

  def checkmate?(color)

  end

  def in_check?(color)

  end

  def find_king(color)

  end

  def pieces
    #return positions of all pieces that are not NullPiece
    self.rows.flatten.reject(&:empty?)
  end

  def dup

  end

end
