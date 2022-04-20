module Steppable

  KNIGHT = [[1,2], [2,1], [-1,2], [-2,1], [1,-2], [2,-1], [-1,-2], [-2,-1]].freeze
  KING = [[1,0], [0,1], [-1,0], [0,-1],[-1, -1], [-1, 1], [1,-1], [1,1]].freeze
  PAWN_REG = [[1,0]].freeze
  PAWN_FIRST = [[1,0],[2,0]].freeze
  PAWN_ATTACK = [[1,1], [-1,1]].freeze

    def moves
      # debugger
      move_arr = []

      move_dirs.each do |dx, dy|
          
            new_pos = [ pos[0] + dx, pos[1] + dy] 

              if board.valid_pos?(new_pos)
                 move_arr << new_pos if board[new_pos].color != color
              end
            end

          if move_dirs == PAWN_REG || move_dirs == PAWN_FIRST
                PAWN_ATTACK.each do |dx, dy|
          
             new_pos = [ pos[0] + dx, pos[1] + dy] 

          if board.valid_pos?(new_pos)
           move_arr << new_pos if board[new_pos].color != color
            end
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

    def pawn_reg
      PAWN_REG
    end

    def pawn_first
      PAWN_FIRST
    end

    def pawn_attack
      PAWN_ATTACK
    end

end