class Board

  def initialize(origin, destination)
    @row = [0, 1, 2, 3, 4, 5, 6, 7]
    @col = [0, 1, 2, 3, 4, 5, 6, 7]
    @board = @row.product(@col)
    @path = []
    @origin = origin
    @destination = destination
    puts "the knight travails! from #{@origin} to #{@destination}!"
    
    travails

  end

  def travails      
    q = [@origin]
    current = []
      until current == @destination
      current = q.shift
      @path.append(current)
      check_dest(current)
      adj_positions = moves(current)
      adj_positions.each do |move| 
      @board.delete(move)
      q.append(move)
      end
    end
  end

  def check_dest(current)    
    if current == @destination
      puts "the knight has reached its destination!"
      puts "number of moves: #{@path.length - 1}"
      puts "the following moves were taken:"
      # p @board
      puts ""
      p @path
        return 
      end
    end
  end

  def moves(current)

    
    start_x = current[0]
    start_y = current[1]
    

      move1 = [start_x + 2, start_y + 1]
      # puts "move 1 is #{move1}"
      move2 = [start_x + 2, start_y - 1]
      # puts "move 2 is #{move2}"
      move3 = [start_x - 2, start_y + 1]
      move4 = [start_x - 2, start_y - 1]
      move5 = [start_x + 1, start_y + 2]
      move6 = [start_x + 1, start_y - 2]
      move7 = [start_x - 1, start_y + 2]
      move8 = [start_x - 1, start_y - 2]

      [move1, move2, move3, move4, move5, move6, move7, move8].select do |(x, y)|
        x.between?(0, 7) && y.between?(0, 7) && @board.include?([x, y])
      end 



  end




test = Board.new([3, 3], [4, 3])
# test.travails([3, 3], [4, 3])
