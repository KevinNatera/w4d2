
class Piece
  attr_reader :board, :symbol, :color

  def initialize(board , color, symbol = :N)
    @board = board
    @color = color
    @symbol = symbol
  end

  def moves(start_pos, end_pos)
    
  end
end




