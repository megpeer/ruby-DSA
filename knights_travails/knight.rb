class Board

  def initialize
    @row = [0, 1, 2, 3, 4, 5, 6, 7]
    @col = [0, 1, 2, 3, 4, 5, 6, 7]
    @board = @row.product(@col)
  end

  def moves(current)
    start_x = current[0]
    start_y = current[1]

      move1 = [start_x + 2, start_y + 1]
      move2 = [start_x + 2, start_y - 1]
      move3 = [start_x - 2, start_y + 1]
      move4 = [start_x - 2, start_y - 1]
      move5 = [start_x + 1, start_y + 2]
      move6 = [start_x + 1, start_y - 2]
      move7 = [start_x - 1, start_y + 2]
      move8 = [start_x - 1, start_y - 2]

      [move1, move2, move3, move4, move5, move6, move7, move8].select do |(x, y)|
        x.between?(0, 7) && y.between?(0, 7)
      end 
  end

  def travails(origin, destination)
      q = [origin]
      current = []
      path = []
        until q.empty?
        current = q.shift
        travel = current
        path << current


        moves(current).each do |move| 
          q << [move, travel] unless path.include?(move)
          
          end

        if current == destination
          puts "the knight has reached its destination!"
          puts "number of moves: #{path.length - 1}"
          puts "the following moves were taken:"
          travel.each do |move| p move
            return travel
          end
        end

      end
    end
  end




test = Board.new
test.travails([3, 3], [4, 3])
