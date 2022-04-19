require_relative 'piece'
require_relative 'sliding_module'

class Rook < Piece
  # extend Slideable
  include Slideable

  def initialize(board, color, symbol)
    super
  end

  def moves

  end

  def move_directions
    
  end

end