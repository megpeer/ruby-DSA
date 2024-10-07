require_relative "node"

class Tree
  attr_accessor :array, :root
  def initialize(array)
    @array = []
    @root = nil
  end

  def sort_array(array)
    @array = array.sort.uniq
  end

  def build_tree(array)
    sort_array(array)
    puts "lets build!"
    p @array
    # if (start>end) return nil
    #   mid = (start + end/2)
    #   @root = Node.new
    #   root.set_left(array, start, mid - 1)
    #   root.set_right(array, mid + 1, end)
    #   return root
    end
  end

  # def pretty_print(node = @root, prefix = '', is_left = true)
  #   pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
  #   puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
  #   pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  # end


end

test = Tree.new
test.build_tree([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])