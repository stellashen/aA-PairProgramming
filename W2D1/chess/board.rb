require_relative 'piece'

class Board

  attr_reader :rows

  def initialize
    @rows = Array.new(8) { Array.new(8) }
    @sentinel = NullPiece.new(nil, rows, nil)
    populate
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

  private

  attr_writer :rows

  def populate
    rows.each_index do |row|
      rows[row].each_index do |col|
        if [0, 1, 6, 7].include?(row)
          # rows[row][col] = Piece.new("b", rows, [row, col])
          print "p"
        else
          print "n"
          # rows[row][col] = @sentinel
        end
      end
      print "\n"
    end
  end

end
