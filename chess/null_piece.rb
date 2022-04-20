require_relative 'piece'
require 'singleton'

class NullPiece < Piece
  include Singleton

  def initialize 
  end

  def moves
  end

  def empty?
    true
  end
end