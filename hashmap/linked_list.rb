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
  #     # returns the total number of nodes in the list
  # def size
  #   counter = 1
  #   current = @head
  #   while current.next_node != nil
  #     counter += 1
  #     current = current.next_node
  #   end
  #   puts "length = #{counter}"
  # end


  #     # returns the first node in the list
  # def head
  #   puts "first node is (#{@head.value})"

  # end


  #     # returns the last node in the list
  # def tail
  #   current = @head
  #     while current.next_node != nil
  #       current = current.next_node
  #     end

  #   puts "last node is (#{current.value})"
  # end


      # returns the node at the given index
  def at(match)
    # counter = key 
    # current = @head
    # until counter == key
    #   current = current.next_node
    # end

    array = []
    current_node = @head
    unless current_node.key == match
      current_node = current_node.next_node
    end
    array << "[#{current_node.key}]"
    puts array
    puts "node with key of [#{current_node.value}] has value of [#{current_node.key}]"
  end


  #     # removes the last element from the list
  def del(key)
  #   current = @head
  #     while current.next_node.next_node != nil
  #       current = current.next_node
  #     end
  #     current.next_node = current.next_node.next_node
  end

    # returns true if the passed in value is in the list and otherwise returns false.
  def contains?(key)
    current = @head
      while current 
        return true if current.value == key
        current = current.next_node
      end
      false
  end


  #     # returns the index of the node containing value, or nil if not found.
  # def find(value)
  #   index = -1
  #   current = @head
  #   while current
  #     index += 1
  #     if current.value == value
  #       puts "(#{value}) is located at index [#{index}]"
  #     end
  #       current = current.next_node
      
  #   end
  # end

  def to_s
    # represent your LinkedList objects as strings, so you can print them out and preview them in the console. The format should be: ( value ) -> ( value ) -> ( value ) -> nil
    bucket = []
    current = @head
    while current != nil
      bucket << "[#{current}]"
      current = current.next_node
    end
    print "(nil)"
    puts ""
    return bucket
  end
  

end
