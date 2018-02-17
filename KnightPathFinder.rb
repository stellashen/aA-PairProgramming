require './skeleton/lib/00_tree_node'
require 'byebug'
class KnightPathFinder

  def initialize(start_pos)
    @start_pos = start_pos
    @board = Array.new(8) { Array.new(8) }
    @visited_positions = [start_pos]
  end

  def self.valid_moves(pos)
    valid_pos = []
    r, c = pos
    possible_pos = [[r-2,c-1],[r-2,c+1],[r-1,c-2],[r-1,c+2],[r+1,c-2],[r+1,c+2],[r+2,c-1],[r+2,c+1]]
    possible_pos.each do |space|
      row, col = space
      valid_pos << space if row.between?(0,7) && col.between?(0,7)
    end
    valid_pos
  end

  def []=(pos)
    x, y = pos
    @board[x][y]
  end

  def new_move_positions(pos)
    KnightPathFinder.valid_moves(pos).reject { |next_pos| @visited_positions.include?(next_pos) }
  end

  def build_move_tree
    children = new_move_positions(@start_pos).map do |pos|
      PolyTreeNode.new(pos)
    end
    root = PolyTreeNode.new(@start_pos, nil, children)

    queue = []
    queue << root

    until queue.empty?
      cur = queue.shift
      cur.children.each do |child|
        child.parent=(cur)
        new_nodes = []
        new_move_positions(child.value).each do |pos|
          new_nodes << PolyTreeNode.new(pos, child)
          @visited_positions << pos
        end
        queue.concat(new_nodes)
      end
    end

    root
  end
end
