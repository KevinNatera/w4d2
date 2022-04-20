require 'byebug'
require_relative 'require'


class Board
  include Cursorable
  attr_reader :display

  def initialize
    @null_piece = NullPiece.instance
    @board = Array.new(8) {Array.new(8, @null_piece)}
    fill_board
    @display = Display.new(@board)
    @display.render
  end

  def move_piece(start_pos)
    @display.render
# debugger
    end_pos = @display.get_input
    # debugger
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
            @display.render
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

    @board[7][3] = Queen.new(self,"white",[7,3])
    @board[0][3] = Queen.new(self,"black",[0,3])

    @board[7][4] = King.new(self,"white",[7,4])
    @board[0][4] = King.new(self,"black",[0,4])

    @board[7][1] = Knight.new(self,"white",[7,1])
    @board[7][6] = Knight.new(self,"white",[7,6])
    @board[0][1] = Knight.new(self,"black",[0,4])
    @board[0][6] = Knight.new(self,"black",[0,4])

    @board[7][2] = Bishop.new(self,"white",[7,2])
    @board[7][5] = Bishop.new(self,"white",[7,5])
    @board[0][2] = Bishop.new(self,"black",[0,2])
    @board[0][5] = Bishop.new(self,"white",[0,5])

  end

end

b = Board.new 

b.move_piece([0,0])