require_relative 'piece'
require_relative 'stepping_module'

class Knight < Piece
  include Steppable

  def initialize(board, color, pos, symbol = :K)
    super
  end

  def move_dirs
    knight_dir
  end

end