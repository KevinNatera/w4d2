
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
        else #Capture Logic Goes Here (Compare Piece Color!!!)

        end 
      end
      moves
    end
end





      # directions = self.move_directions

      # start_x, start_y = start_pos.first, start_pos.last
      # end_x, end_y = end_pos.first, end_pos.last
      # move_x, move_y = (end_x - start_x), (end_y - start_y)
      
        #horizontal
      # if move_y == 0 
      #   i = 0

      #   while i < 8
      #     if @board[i][start_y].is_a?(NullPiece) 
      #       moveArr << [i,start_y] 
      #     else 
      #         break
      #     end
      #     i += 1
      #   end
      # end 
        # #vertical 
        # if move_x == 0
        # end
        # #diagonal 
        # if move_x == move_y && move_x != 0 && move_y != 0

        # end
        #  moveArr 
      # end
# end
