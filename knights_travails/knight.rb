# initialize the chess board (8x8)
#nodes

#    0   1   2   3   4   5   6   7
# 0    |   |   |   |   |   |   |   
#   ---+---+---+---+---+---+---+---
# 1    |   |   |   |   |   |   |   
#   ---+---+---+---+---+---+---+---
# 2    |   |   |   |   |   |   |   
#   ---+---+---+---+---+---+---+---
# 3    |   |   |   |   |   |   |   
#   ---+---+---+---+---+---+---+---
# 4    |   |   |   |   |   |   |   
#   ---+---+---+---+---+---+---+---
# 5    |   |   |   |   |   |   |   
#   ---+---+---+---+---+---+---+---
# 6    |   |   |   |   |   |   |   
#   ---+---+---+---+---+---+---+---
# 7    |   |   |   |   |   |   |   
#   ---+---+---+---+---+---+---+---
class Board
  def initialize(origin, destination)
    @width = [0, 1, 2, 3, 4, 5, 6, 7]
    @board = @width.product(@width)
    @origin = origin
    @destination = destination

    # print @board
    puts ""
    puts "knight is at #{@origin}"
    puts "destination is #{@destination}"
  end



    # def print_board
      
    # end
  end
# user inputs knight start coordinates
# user inputs end location coordinates
# calculate shortest amount of moves in s 1,2 or 2,1 jump
new_game = Board.new([3, 3], [0, 0])
# new_game.print_board