require_relative 'piece'
require_relative 'sliding_module'

class Queen < Piece
  include Slideable

  def initialize(board, color, pos, symbol = :Q)
    super
  end

  def move_dirs
    diagonal + horiz_vert
  end

end