require_relative 'piece'
require_relative 'stepping_module'

class King < Piece
  include Steppable

  def initialize(board, color, pos, symbol = '♔')
    super
  end

  def move_dirs
    king_dir
  end

end