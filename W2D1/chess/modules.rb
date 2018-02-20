module Slidable
  def moves(move_dirs)
    total_moves = []
    if move_dirs[:hori_vert] == true
      total_moves += hori_vert
    end
    if move_dirs[:diagonal] == true
      total_moves += diagonal
    end
    total_moves
  end

  def hori_vert(start_pos)
    moves = []
    [[-1, 0], [1, 0], [0, 1], [0, -1]].each do |dir|
      curr_pos = start_pos
      while @board.valid_pos?(new_pos)
        x, y = dir
        i, j = curr_pos
        curr_pos = [x + i, y + j]
        moves << curr_pos
      end
      moves.pop
    end
    moves
  end

  def diagonal
    moves = []
    [[-1, -1], [1, 1], [-1, 1], [1, -1]].each do |dir|
      curr_pos = start_pos
      while @board.valid_pos?(new_pos)
        x, y = dir
        i, j = curr_pos
        curr_pos = [x + i, y + j]
        moves << curr_pos
      end
      moves.pop
    end
    moves
  end
end

module Stepable
end
