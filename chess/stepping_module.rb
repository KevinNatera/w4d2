module Steppable

  KNIGHT = [[1,2], [2,1], [-1,2], [-2,1], [1,-2], [2,-1], [-1,-2], [-2,-1]].freeze
  KING = [[1,0], [0,1], [-1,0], [0,-1],[-1, -1], [-1, 1], [1,-1], [1,1]].freeze

    def moves
      # debugger
      move_arr = []

      move_dirs.each do |dx, dy|

        new_pos = [ pos[0] + dx, pos[1] + dy] 

         if board.valid_pos?(new_pos)
           move_arr << new_pos if board[new_pos].color != color
         end

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





end