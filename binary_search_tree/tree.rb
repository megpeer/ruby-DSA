require_relative "node"

class Tree
  # attr_accessor :root
  def initialize(array)
    @root = build_tree(array)
  end

  def build_tree(array)
    sorted = array.sort.uniq
    length = sorted.length
    build_tree_recur(0, length - 1, sorted)
  end

  def build_tree_recur(left, right, array)
    return if left > right
   
      mid = left + ((right - left) / 2)
      root = Node.new(array[mid])
      root.left = build_tree_recur(left, mid - 1, array)
      root.right = build_tree_recur(mid + 1, right, array)
      root
  end


  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end


end

test = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
# test.sorted_to_BST
test.pretty_print