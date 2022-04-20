require_relative 'piece'
require_relative 'stepping_module'

class Pawn < Piece
  include Steppable
  attr_accessor :has_moved

  def initialize(board, color, pos, symbol = '♟')
    super
    @has_moved = false
  end

  def move_dirs
    if !@has_moved
      pawn_first
    else
      pawn_reg
    end
  end

end