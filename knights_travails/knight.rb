
class Board

  def initialize(origin, destination)
    @row = [0, 1, 2, 3, 4, 5, 6, 7]
    @col = [0, 1, 2, 3, 4, 5, 6, 7]
    @board = @row.product(@col)
    @data = [[origin, origin, 0]]
    @origin = origin
    @destination = destination
    @move_count = 0
    puts "the knight travails! from #{@origin} to #{@destination}!"
    travails
  end

  def travails      
    q = [@origin]
    current = []
      until q.empty?
      current = q.shift
      moves(current).each do |move|
        check_dest(move, current) 
      # @data.append([move, current, @move_count])
      @board.delete(move)
      q.append(move)
      
      end
      end
  end

  def check_dest(move, current)  
    @data.append([move, current])  
    if move == @destination
      puts "the knight has reached its destination!"
  
      backtrack
        return 
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
        # x.between?(0, 7) && y.between?(0, 7) && 
        @board.include?([x, y])
      end
    end

  def backtrack
    step = nil
    last = @data.pop
    path = []
    move_count = 1
    until last[0] == @origin
      path.append(last[0])
      step = last[1]
      last = last_gasp(step)
      move_count += 1
    end
    path.append(@origin)
      puts "number of moves: #{move_count}"
  puts "the following moves were taken:"
  p path.reverse
  end

  def last_gasp(step)
    @data.find{|el| el[0] == step}    
  end
end
