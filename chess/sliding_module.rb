
module Slideable
  
  def moves(start_pos, end_pos)
      moveArr = []
      # directions = self.move_directions

      start_x, start_y = start_pos.first, start_pos.last
      end_x, end_y = end_pos.first, end_pos.last
      move_x, move_y = (end_x - start_x), (end_y - start_y)
      
        #horizontal
        if move_y == 0 
          i = 0

          while i < 8
            if @board[i][start_y].is_a?(NullPiece) 
              moveArr << [i,start_y] 
            else 
               break
            end
            i += 1
          end
        end 
        # #vertical 
        # if move_x == 0
        # end
        # #diagonal 
        # if move_x == move_y && move_x != 0 && move_y != 0

        # end
         moveArr 
      end
end
