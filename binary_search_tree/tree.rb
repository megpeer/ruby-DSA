require_relative "node"

class Tree
  attr_accessor :array, :root
  def initialize
    @array = []
    @root = nil
  end

  def sort_array(array)
    @array = array.sort.uniq
  end

  def build_tree_recur(array, start, last)
    if (start > last) 
      return nil
    else
      mid = (start + last / 2)
      @root = Node.new(array[mid])
      @root.left = build_tree_recur(array, start, mid - 1)
      @root.right = build_tree_recur(array, mid + 1, last)
      return @root
    end
  end
  

  def sorted_to_BST
    return build_tree_recur(@array, 0, @array.length - 1)
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end


end

test = Tree.new
test.sort_array([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
test.sorted_to_BST
test.pretty_print