class Board

  attr_accessor :rows

  def initialize
    @rows = Array.new(8) { Array.new(8) }
    @sentinel = []
    populate
  end

  def populate
    rows.each_with_index do |row, r|
      row.each_with_index.map do |piece, c|
        Piece.new("b", rows, [r, c])
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

  def move_piece(color, start_pos, end_pos)

  end

  def valid_pos?(pos)

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

  end

  def dup

  end

  def move_piece!(color, start_pos, end_pos)

  end
end
