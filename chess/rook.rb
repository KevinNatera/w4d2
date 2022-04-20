require_relative 'piece'
require_relative 'sliding_module'

class Rook < Piece
  # extend Slideable
  include Slideable

  def initialize(board, color, pos, symbol = :R)
    super
  end

  def move_dirs
    horiz_vert
  end

end