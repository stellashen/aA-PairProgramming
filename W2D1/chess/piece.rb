class Piece

  def initialize(color, board, pos)
    @board = board
    @pos = pos
    @color = color
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
    "this is a piece"
  end

  private

  def move_into_check?(end_pos)
  end

end

class Rook < Piece

  def initialize(color, board, pos)
    super
    @symbol = :♜
  end

end

class Bishop < Piece

  def initialize(color, board, pos)
    super
    @symbol = :♝
  end
end

class Queen < Piece

  def initialize(color, board, pos)
    super
    @symbol = :♛
  end
end

class Knight < Piece

  def initialize(color, board, pos)
    super
    @symbol = :♞
  end
end

class King < Piece

  def initialize(color, board, pos)
    super
    @symbol = :♚
  end
end

class Pawn < Piece

  def initialize(color, board, pos)
    super
    @symbol = :♟
  end
end

class NullPiece < Piece

  def initialize(color, board, pos)
    super
    @symbol = nil
  end
end
