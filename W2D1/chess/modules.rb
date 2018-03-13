module Slidable
  def moves(move_dirs)
    total_arr = []
    if move_dirs[:hori_vert] == true
      total_arr += [[-1, 0], [1, 0], [0, 1], [0, -1]]
    end
    if move_dirs[:diagonal] == true
      total_arr += [[-1, -1], [1, 1], [-1, 1], [1, -1]]
    end
    add_moves(total_arr, self.pos)
  end

  def add_moves(dir_arr, start_pos)
    moves = []
    dir_arr.each do |dir|
      curr_pos = start_pos
      while @board[curr_pos].empty? || curr_pos == start_pos
        x, y = dir
        i, j = curr_pos
        curr_pos = [x + i, y + j]
        if !@board[curr_pos].empty? && @board[curr_pos].color == self.color
          next
        end
        moves << curr_pos
      end
    end
    moves
  end

end

module Stepable
  #returns all valid end positions
  def moves(move_diffs)
    moves = []
    start_pos = self.pos
    move_diffs.each do |diff|
      x, y = diff
      i, j = start_pos
      curr_pos = [x + i, y + j]
      if !@board[curr_pos].empty? && @board[curr_pos].color == self.color
        next
      end
      moves << curr_pos
    end
    moves
  end
end
