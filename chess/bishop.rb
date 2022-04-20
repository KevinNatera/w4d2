require_relative 'piece'
require_relative 'sliding_module'

class Bishop < Piece
  include Slideable

  def initialize(board, color, pos, symbol = '♗')
    super
  end

  def move_dirs
    diagonal
  end

end