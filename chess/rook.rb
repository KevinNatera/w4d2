require_relative 'piece'
require_relative 'sliding_module'

class Rook < Piece
  include Slideable

  def initialize(board, color, pos, symbol = '♖')
    super
  end

  def move_dirs
    horiz_vert
  end

end