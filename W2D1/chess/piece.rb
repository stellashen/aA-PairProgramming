require 'colorize'
require 'singleton'
require_relative 'modules'
=begin
<~~~About the colorize gem~~~>

## Useful links:
https://github.com/fazibear/colorize
https://stackoverflow.com/questions/1489183/colorized-ruby-output

## Useful commands:
String.colors                       # return array of all possible colors names
String.color_samples                # displays color samples in all combinations

puts "This is blue".colorize(:blue)
puts "This is also blue".colorize(:color => :blue)
puts "This is light blue with red background".colorize(:color => :light_blue, :background => :red)
puts "This is light blue with red background".colorize(:light_blue ).colorize( :background => :red)

## Test our to_s method in Terminal & choose text/background color
pry(main)> load 'piece.rb'
# look at black pieces on yellow/green background
pry(main)> k = King.new(:black, 0, [0,0])
pry(main)> puts k.to_s.colorize(:color => k.color, :background => :yellow)
pry(main)> puts k.to_s.colorize(:color => k.color, :background => :green)
# look at light_white pieces
pry(main)> q = Queen.new(:light_white, 0, [1,0])
pry(main)> puts q.to_s.colorize(:color => q.color, :background => :green)
pry(main)> puts q.to_s.colorize(:color => q.color, :background => :yellow)
# look at two pieces side by side
pry(main)> k_str = k.to_s.colorize(:color => k.color, :background => :yellow)
pry(main)> q_str = q.to_s.colorize(:color => q.color, :background => :green)
pry(main)> puts "#{k_str}#{q_str}"
=end
class Piece
  attr_accessor :pos

  def initialize(color, board, pos)
    @board = board
    @pos = pos
    @color = color
  end

  def to_s
    symbol_in_str = self.symbol.to_s # turn symbol into string
    # add one space before and two spaces after symbol
    " #{symbol_in_str}  "
  end

  def empty?
    self.is_a?(NullPiece)
  end

  def valid_moves
  end

  def symbol
    p = NullPiece.new
    p.symbol
  end

  private

  def move_into_check?(end_pos)
  end

end

class Rook < Piece
  include Slidable

  attr_reader :symbol, :color
  def initialize(color, board, pos)
    super
    @symbol = :♜
  end

  def move_dirs
    { hori_vert: true, diagonal: false }
  end
end

class Bishop < Piece
  include Slidable
  attr_reader :symbol, :color
  def initialize(color, board, pos)
    super
    @symbol = :♝
  end

  def move_dirs
    { hori_vert: false, diagonal: true }
  end
end

class Queen < Piece
  include Slidable
  attr_reader :symbol, :color
  def initialize(color, board, pos)
    super
    @symbol = :♛
  end

  def move_dirs
    { hori_vert: true, diagonal: true }
  end
end

class Knight < Piece
  include Stepable
  attr_reader :symbol, :color
  def initialize(color, board, pos)
    super
    @symbol = :♞
  end

  def move_dirs
    [
      [2, -1],
      [2, 1],
      [1, 2],
      [-1, 2],
      [-2, 1],
      [-2, -1],
      [1, -2],
      [-1, -2]
    ]
  end
end

class King < Piece
  include Stepable
  attr_reader :symbol, :color
  def initialize(color, board, pos)
    super
    @symbol = :♚
  end

  def move_dirs
    [
      [1, 0],
      [1, 1],
      [0, -1],
      [-1, -1],
      [-1, 0],
      [-1, -1],
      [0, -1],
      [1, -1]
    ]
  end
end

class Pawn < Piece
  attr_reader :symbol, :color
  def initialize(color, board, pos)
    super
    @symbol = :♟
  end

  def move_dirs
    if self.color == :black
      [
        [1, 0],
        [1, -1],
        [1, 1]
      ]
    else
      [
        [-1, 0],
        [-1, -1],
        [-1, 1]
      ]
    end
  end

  def moves(move_dirs)
    total_moves = []

    start_pos = self.pos
    3.times do |i|
      x, y = move_dirs[i]
      i, j = start_pos
      curr_pos = [x + i, y + j]
      if i == 0 && @board[curr_pos].empty?
        total_moves << curr_pos
      elsif i != 0 && @board[curr_pos].color != self.color
        total_moves << curr_pos
      end
    end

    total_moves
  end

end

class NullPiece < Piece
  include Singleton
  attr_reader :symbol, :color
  def initialize
    @color = "n" # n for no color
    @symbol = :x
  end
end
