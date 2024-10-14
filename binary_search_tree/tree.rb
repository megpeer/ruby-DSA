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

  # def delete(key, current = @root)
  #   ##IF current node's key == input key
  #   if current.key == key
  #     #return if left and right are nil (leaf node)
  #     return if current.left.nil? && current.right.nil?
  #     #store the current node in a temp variable
  #     temp = current
  #       #until temp node has nil to the left, keep going left then return the right
  #       if temp.left.nil?
  #         temp = temp.right
  #         return temp if temp.left.nil?
  #         temp = temp.left until temp.left.nil?
  #       else
  #       #
  #         temp = temp.left
  #         return temp if temp.right.nil?
  #         temp = temp.right until temp.right.nil?
  #       end
      
  #     delete(temp.key, @root)
  #     current.key = temp.key

  #   ##IF root is bigger than key   
  #   elsif current.key > key
  #     current.left = delete(key, current.left)
  #   ##IF root is less than key
  #   else
  #     current.right = delete(key, current.right)
  #   end
  # current
  # end
  
  def get_successor(current)
    current = current.right
    while current != nil && current.left != nil
      current = current.left
    end
    return current
  end

  def delete(key, current = @root)
    #base case
    if current == nil
      return current
    elsif current.key > key
      current.left = delete(key, current.left)
    elsif current.key < key
      current.right = delete(key, current.right)
    elsif current.left == nil 
      return current.right
    elsif current.right == nil
      return current.left
    end

    #when both children are present
      succ = get_successor(current)
      current.key = succ.key
      current.right = delete(succ.key, current.right)
      current
  end




  def find(key)
    current = @root
    until current.nil?
      return current if current.key == key
      if current.key > key
        current = current.left
      elsif current.key < key
        current = current.right
      end
    end
  end

  def level_order
    arr = []
    queue = [@root]
    until queue.empty?
        current = queue.shift
        queue << current.left unless current.left == nil
        queue << current.right unless current.right == nil
        if block_given?
          yield(current)
        else
        arr << current.key
        end
    end
    p arr unless block_given?
  end
  # def inorder
  #   arr = []
  #   inorder_recur {|key| arr << key}
  #   p arr
  # end

  def inorder(current = @root, arr = [])
      return if current.nil?
      values = arr
        inorder(current.left, values)
        values << current.key
        inorder(current.right, values)
        values
  end

  def preorder(current = @root, arr = [])
    return if current.nil?
    values = arr
      values << current.key
      preorder(current.left, values)
      preorder(current.right, values)
      values
  end

  def postorder(current = @root, arr = [])
    return if current.nil?
    values = arr
      postorder(current.left, values)
      postorder(current.right, values)
      values << current.key
      values
  end



  # do not adjsut below line
#----------------------------------------------
  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.key}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end

test = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
# # test.pretty_print
# test.insert(11111)
# test.insert (10)
test.pretty_print
puts "level order traversal"
test.level_order
# test.level_order.each {|x| puts "#{x}"}
puts "inorder traversal:"
puts "[1, 3, 4, 5, 7, 8, 9, 23, 67, 324, 6345]"
p test.inorder
puts "preorder traversal:"
puts"[8, 4, 1, 3, 5, 7, 67, 9, 23, 324, 6345]"
p test.preorder
puts "postorder traversal:"
puts "[3, 1, 7, 5, 4, 23, 9, 6345, 324, 67, 8]"
p test.postorder