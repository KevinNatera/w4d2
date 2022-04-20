require 'byebug'
require_relative 'require'
# require_relative 'piece'
# require_relative 'sliding_module'
# require_relative 'stepping_module'
# require_relative 'null_piece'
# require_relative 'rook'
# require_relative 'queen'
# require_relative 'bishop'
# require_relative 'king'
# require_relative 'knight'

class Board

  def initialize
    @null_piece = NullPiece.instance
    @board = Array.new(8) {Array.new(8, @null_piece)}
    fill_board
  end

  def move_piece(start_pos, end_pos)
    start_x = start_pos.first
    start_y = start_pos.last
    if @board[start_x][start_y].is_a?(NullPiece) || !valid_pos?(start_pos)
      raise "Error: Invalid Start Position."
    end

    end_x = end_pos.first
    end_y = end_pos.last
    if !@board[end_x][end_y].is_a?(NullPiece) || !valid_pos?(end_pos)
      raise "Error: Invalid Move."
    end

    if valid_pos?(start_pos) && valid_pos?(end_pos)

      new_positions = @board[start_x][start_y].moves
          if new_positions.include?(end_pos)
            @board[start_x][start_y].pos = end_pos
            @board[end_pos.first][end_pos.last] = @board[start_x][start_y]
            @board[start_x][start_y] = @null_piece
          else 
            raise "Invalid position!"
          end

    end
  end

  def [](pos)
    raise "Error: Invalid Position." unless valid_pos?(pos)
    row, col = pos
    @board[row][col]
  end

  def []=(pos, piece)
    raise "Error: Invalid Position." unless valid_pos?(pos)
    row, col = pos
    @board[row][col] = piece
  end

  def valid_pos?(pos)
    x, y = pos.first, pos.last
    if x >= 0 && x <= 7 && y >= 0 && y <= 7
      true
    else
      false
    end
  end

  def fill_board
    @board[7][0] = Rook.new(self,"white",[7,0])
    @board[7][7] = Rook.new(self,"white",[7,7])
    @board[0][0] = Rook.new(self,"black",[0,0])
    @board[0][7] = Rook.new(self,"black",[0,7])

    @board[7][4] = Queen.new(self,"white",[7,4])
    @board[0][4] = Queen.new(self,"black",[0,4])

    @board[7][5] = King.new(self,"white",[7,5])
    @board[0][5] = King.new(self,"black",[0,5])

    @board[7][1] = Knight.new(self,"white",[7,1])
    @board[7][6] = Knight.new(self,"white",[7,6])
    @board[0][1] = Knight.new(self,"black",[0,4])
    @board[0][6] = Knight.new(self,"black",[0,4])
  end

end