module Slideable

  HORIZ_VERT = [[1,0], [0,1], [-1,0], [0,-1]].freeze
  DIAGONAL = [[-1, -1], [-1, 1], [1,-1], [1,1]].freeze

    def moves
      move_arr = []
      move_dirs.each do |dx, dy|
        move_arr.concat(get_unblocked_moves(dx, dy))
      end
      move_arr
    end

    def move_dirs
      raise "There was an error."
    end

    def horiz_vert
      HORIZ_VERT
    end

    def diagonal
      DIAGONAL
    end

    def get_unblocked_moves(dx, dy)
      pos_x, pos_y = pos
      moves = []
      loop do
        pos_x, pos_y = pos_x + dx, pos_y + dy
        pos = [pos_x, pos_y]
        break unless board.valid_pos?(pos)
        if board[pos].empty?
          moves << pos
        else 
          moves << pos if board[pos].color != color
          break
        end 
      end
      moves
    end
end