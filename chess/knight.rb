require_relative 'piece'
require_relative 'stepping_module'

class Knight < Piece
  include Steppable

  def initialize(board, color, pos, symbol = '♘')
    super
  end

  def symbol
    '♘'.colorize(color)
  end

  def move_dirs
    knight_dir
  end

end