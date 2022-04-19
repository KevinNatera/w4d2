require 'byebug'
require_relative 'piece'
require_relative 'null_piece'
require_relative 'rook'
require_relative 'sliding_module'

class Board

  def initialize
    @null_piece = NullPiece.instance
    @board = Array.new(8) {Array.new(8, @null_piece)}
    @board[2][4] = Rook.new(self,"black",:R)
  end

  def move_piece(start_pos, end_pos)
    start_x = start_pos.first
    start_y = start_pos.last
    if @board[start_x][start_y].is_a?(NullPiece) || !valid_pos?(start_pos)
      raise "Error: Invalid Start Position."
    end

    #iterate over slidable module array and validate through here
    end_x = end_pos.first
    end_y = end_pos.last
    if !@board[end_x][end_y].is_a?(NullPiece) || !valid_pos?(end_pos)
      raise "Error: Invalid Move."
    end

    if valid_pos?(start_pos) && valid_pos?(end_pos)
      @board[end_x][end_y] = @board[start_x][start_y]
      @board[start_x][start_y] = @null_piece

      # new_pos = @board[start_x][start_y].moves(start_pos,end_pos)
      # @board[new_pos.first][new_pos.last] = @board[start_x][start_y]
      # @board[start_x][start_y] = @null_piece

      #call def moves on piece so @board[start_x][start_y].moves 
    end
  end

  def [](pos)
    @board[pos.first][pos.last]
  end

  def []=(pos, val)
    @board[pos.first][pos.last] = val
  end

  def take_piece
  end

  def valid_pos?(pos)
    x, y = pos.first, pos.last
    if x >= 0 && x <= 7 && y >= 0 && y <= 7
      return true
    else
      false
    end
  end

end