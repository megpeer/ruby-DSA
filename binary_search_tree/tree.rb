require_relative "node"

class Tree
  attr_accessor :root
  def initialize(array)
    @root = build_tree(array)
  end

  def build_tree(array)
    sorted = array.sort.uniq
    p sorted
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

  def height(key)
    current = find(key)
    
    return calculate_height(current)
    # puts "#{key} is #{calculate_height(current)} high "
  end

  def calculate_height(current)
    return if current.nil?
    return 1 if current.left == nil && current.right == nil

    left = current.left.nil? ? 0 : calculate_height(current.left)
    right = current.right.nil? ? 0 : calculate_height(current.right)
    
    return 1 + if left > right
      left
    else
      right
    end
  end



  def depth(key)
    current = @root
    count = 1
    until current.nil?
      return puts "#{key} is #{count} deep" if current.key == key
      if current.key > key
        count += 1
        current = current.left
      elsif current.key < key
        count += 1
        current = current.right
      end
    end 
  end

  def balanced?(current = @root)
      left = height(current.left.key)
      right = height(current.right.key)
      differential = left - right
      differential.between?(-1, 1)
  end

  def rebalance
    new_array = inorder
    # p new_array
    @root = self.build_tree(new_array)
  end
      

   

  # do not adjsut below line
#----------------------------------------------
  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.key}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end
