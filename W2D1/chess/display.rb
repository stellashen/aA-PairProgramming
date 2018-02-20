require "colorize"
require_relative "board"

class Display

  def initialize(board)
    @board = board
    # @cursor = cursor
  end

  def render
    @board.rows.each_with_index do |row, row_num|
      row.map.with_index do |piece, col_num|
        colored_text_piece = piece.to_s.colorize(piece.color)
        if piece.is_a?(NullPiece)
          background = grid_color([row_num, col_num])
        else
          background = grid_color(piece.pos)
        end
        colored = colored_text_piece.colorize(background: background)
        print colored
      end
      puts ""
    end
  end

  def grid_color(pos)
    row, col = pos
    if row.even? && col.even? || row.odd? && col.odd?
      :yellow
    else
      :green
    end
  end


end
