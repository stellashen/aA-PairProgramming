class Piece

  def initialize(color, board, pos)
    @board = board
    @pos = pos
    @color = color
  end

  def self.populate
    board.rows[0, 0] = Rook.new(:b, @board, [0, 0])
    # board.rows[0, 7] = Rook.new()
    # board.rows[7, 0] = Rook.new()

  end

  def to_s

  end

  def empty?
  end

  def valid_moves
  end

  def pos=(val)
  end

  def symbol

  end

  private

  def move_into_check?(end_pos)
  end

end

class Rook < Piece

  def initialize(color, board, pos)
    super(color, board, pos)
    @symbol = :♜
  end

end

class Bishop < Piece

  def initialize
    super
    @symbol = :♝
  end
end

class Queen < Piece

  def initialize
    super
    @symbol = :♛
  end
end

class Knight < Piece

  def initialize
    super
    @symbol = :♞
  end
end

class King < Piece

  def initialize
    super
    @symbol = :♚
  end
end

class Pawn < Piece

  def initialize
    super
    @symbol = :♟
  end
end

class NullPiece < Piece

  def initialize
    super
    @symbol = nil
  end
end
