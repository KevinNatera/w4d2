module Steppable

  KNIGHT = [[1,2], [2,1], [-1,2], [-2,1], [1,-2], [2,-1], [-1,-2], [-2,-1]].freeze
  KING = [[1,0], [0,1], [-1,0], [0,-1],[-1, -1], [-1, 1], [1,-1], [1,1]].freeze

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

    def king_dir
      KING
    end

    def knight_dir
      KNIGHT
    end

    def get_unblocked_moves(dx, dy)
  debugger
      pos_x, pos_y = pos
      moves = []

      # loop do
        pos_x, pos_y = pos_x + dx, pos_y + dy
        pos = [pos_x, pos_y]
        # break unless board.valid_pos?(pos) 

        if board[pos].empty? && board.valid_pos?(pos) 
          moves << pos
        else 
          moves << pos if board[pos].color != color
          # break
        end 
      # end
      moves
    end








end