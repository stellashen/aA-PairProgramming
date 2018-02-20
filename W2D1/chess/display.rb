require "colorize"


class Display

  def initialize(board)
    @board = board
    # @cursor = cursor
  end

  def render
    @board.rows.each_index do |row|
      row.map.with_index do |piece, col|
        #piece.colorize(SOMETHING)
      end
    end
  end


end
