module Slidable
  def moves(move_dirs)
    total_moves = []
    if move_dirs[:hori_vert] == true
      total_moves += hori_vert(self.pos)
      #hori_arr = [[-1, 0], [1, 0], [0, 1], [0, -1]]
      #total_moves += add_moves[hori_arr, self.pos]
    end
    if move_dirs[:diagonal] == true
      #dia_arr = [[-1, -1], [1, 1], [-1, 1], [1, -1]]
      #total_moves += add_moves[dia_arr, self.pos]
      total_moves += diagonal(self.pos)
    end
    total_moves
  end

  def hori_vert(start_pos)
    moves = []
    [[-1, 0], [1, 0], [0, 1], [0, -1]].each do |dir|
      curr_pos = start_pos
      debugger
      while @board.valid_pos?(curr_pos) || curr_pos == start_pos
        x, y = dir
        i, j = curr_pos
        curr_pos = [x + i, y + j]
        next unless @board.valid_pos?(curr_pos)
        moves << curr_pos
      end
    end
    moves
  end

  def diagonal(start_pos)
    moves = []
    [[-1, -1], [1, 1], [-1, 1], [1, -1]].each do |dir|
      curr_pos = start_pos
      while @board.valid_pos?(curr_pos) || curr_pos == start_pos
        x, y = dir
        i, j = curr_pos
        curr_pos = [x + i, y + j]
        next unless @board.valid_pos?(curr_pos)
        moves << curr_pos
      end
    end
    moves
  end
end

module Stepable
end
