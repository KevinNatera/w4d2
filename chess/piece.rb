
class Piece
  attr_reader :board, :symbol, :color
  attr_accessor :pos

  def initialize(board , color, pos, symbol = :N)
    @board = board
    @color = color
    @pos = pos
    @symbol = symbol
  end

  def moves
  end

  def empty?
    false
  end
end




