require_relative 'piece'
require_relative 'sliding_module'

class Rook < Piece
  # extend Slideable
  include Slideable

  def initialize(board, color, symbol)
    super
  end

  # def moves(start_pos, end_pos)
  #     #should access module, skips it instead
  #     # [4,4]
  # end

  def move_directions
    
  end

end