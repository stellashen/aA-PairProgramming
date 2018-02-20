require_relative 'piece'

class Board

  attr_accessor :rows

  def initialize
    @sentinel = NullPiece.new(nil, rows, nil)
    @rows = Array.new(8) { Array.new(8) }
    populate
  end

  def populate
    [:white, :black].each do |color|
      fill_top_bottom_rows(color)
      fill_pawn_rows(color)
      fill_sentinels
    end
  end

  def fill_top_bottom_rows(color)
    # pieces = [ Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook ]
    pieces = [ "R", "K", "B", "Q", "Z", "B", "K", "R"]
    if color == :black
      row = 0
    else
      row = 7
    end

    pieces.each_with_index do |piece, col|
      @rows[row][col] = piece#piece.new(color, self, [row, col])
    end
  end

  def fill_pawn_rows(color)
    if color == :black
      row = 1
    else
      row = 6
    end

    8.times do |col|
      @rows[row][col] = "P" #Pawn.new(color, self, [row, col])
    end
  end

  def fill_sentinels
    (2..5).each do |row|
      p row
      8.times do |col|
        rows[row][col] = "_"#@sentinel
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
    @display = Display.new(@rows)
  end

  def move_piece(color, start_pos, end_pos)
    # if piece color is not the right turn color
    if piece.color != color
      raise 'Please move your own piece!'
    # elsif end_pos is not a valid move (not on board or not end_pos?)
    #   raise 'You can\'t move here.'

    move_piece!(start_pos, end_pos)
  end

  def move_piece!(color, start_pos, end_pos)
    # self[end_pos] is piece
    # self[start_pos] is sentinel
    # piece.pos is endpos
  end

  def valid_pos?(pos)
    #piece is within the board ([0,0], [7,7])
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
    #return all pieces without null (flattened array?)
  end

  def dup

  end

end
