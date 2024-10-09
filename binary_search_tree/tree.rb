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

  def insert(key)
    current = @root
    until current.nil? 
      if current.key > key
        if current.left.nil?
          current.left = Node.new(key)
          return
        end
        current = current.left
      elsif current.key < key
        if current.right.nil?
          current.right = Node.new(key)
          return
        end
        current = current.right
      else
        return
      end
    end
  end

#     Initilize the current node (say, currNode or node) with root node
#     
# Compare the key with the current node.
# 
# Move left if the key is less than or equal to the current node value.
# 
# Move right if the key is greater than current node value.
# 
# Repeat steps 2 and 3 until you reach a leaf node.
# 
# Attach the new key as a left or right child based on the comparison with the leaf node’s value.

  # do not adjsut below line
#----------------------------------------------
  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.key}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end

test = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
test.pretty_print
test.insert(11111)
test.pretty_print