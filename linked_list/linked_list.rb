class LinkedList
  def initialize
    @head = nil
  end
  
  
  class Node
    attr_accessor :value, :next_node
    def initialize(value, next_node)
      @value = value
      @next_node = nil
    end
  end


      #adds new node containing value to end of the list
  def append(value)
    if @head.nil?
      @head = Node.new(value, nil)
    else 
      current = @head
      while current.next_node != nil
        current = current.next_node
      end
      current.next_node = Node.new(value, nil)
    end
  end


      # adds a new node containing value to the start of the list
  def prepend(value)
    new_node = Node.new(value, @head)
    new_node.next_node = @head
    @head = new_node
  end


      # returns the total number of nodes in the list
  def size
    counter = 1
    current = @head
    while current.next_node != nil
      counter += 1
      current = current.next_node
    end
    puts "length = #{counter}"
  end


      # returns the first node in the list
  def head
    puts "first node is (#{@head.value})"

  end


      # returns the last node in the list
  def tail
    current = @head
      while current.next_node != nil
        current = current.next_node
      end

    puts "last node is (#{current.value})"
  end


      # returns the node at the given index
  def at(index)
    counter = 0
    current = @head
    while current.next_node != nil && counter != index
      counter += 1
      current = current.next_node
    end
    puts "node at index [#{index}] is (#{current.value})"
  end


      # removes the last element from the list
  def pop
    current = @head
      while current.next_node.next_node != nil
        current = current.next_node
      end
      current.next_node = current.next_node.next_node
  end

    # returns true if the passed in value is in the list and otherwise returns false.
  def contains?(value)
    current = @head
      while current 
        return true if current.value == value
        current = current.next_node
      end
      false
  end


      # returns the index of the node containing value, or nil if not found.
  def find(value)
    index = -1
    current = @head
    while current
      index += 1
      if current.value == value
        puts "(#{value}) is located at index [#{index}]"
      end
        current = current.next_node
      
    end
  end

  def to_s
    # represent your LinkedList objects as strings, so you can print them out and preview them in the console. The format should be: ( value ) -> ( value ) -> ( value ) -> nil
    current = @head
    while current != nil
      print "(#{current.value}) -> "
      current = current.next_node
    end
    print "(nil)"
    puts ""
  end
  

end

list = LinkedList.new
list.append('dog')
list.append('cat')
list.append('parrot')
list.append('hamster')
list.append('snake')
list.append('turtle')
list.prepend('normalcy')
list.prepend('piracy')
list.prepend('dormancy')
list.prepend('fancy')

list.to_s
list.size
list.head
list.tail
list.at(0)


puts ""
puts "remove last element:"
list.pop
list.to_s

puts""

puts list.contains?('hamster')
puts list.contains?('misery')

puts ""

list.find('hamster')