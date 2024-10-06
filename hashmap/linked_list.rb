require_relative 'node'
class LinkedList
  attr_accessor :head
  def initialize
    @head = nil
  end
  
  


      #adds new node containing value to end of the list
  def append(key, value)
    if @head.nil?
      @head = Node.new(key, value, nil)
    else 
      current = @head
      while current.next_node != nil
        current = current.next_node
      end
      current.next_node = Node.new(key, value, nil)
    end
  end

  def entries_to_array
    collect_from_nodes { |node| [node.key, node.value] }
  end

  def collect_from_nodes
    array = []
    current_node = @head
    until current_node.nil?
      array << yield(current_node)
      current_node = current_node.next_node
    end
    array
  end

      # returns the node at the given index
  def at(match)
    current_node = @head
    unless current_node.key == match
      current_node = current_node.next_node
    end
    puts "node with key of [#{current_node.key}] has value of [#{current_node.value}]"
  end


  #     # removes the last element from the list
  def del(match)
    current = @head
      until current.key == match
        current = current.next_node
      end
    current.value = ""
  end

    # returns true if the passed in value is in the list and otherwise returns false.
  def contains?(key)
    current = @head
      while current 
        return true if current.key == key
        current = current.next_node
      end
      false
  end
end
