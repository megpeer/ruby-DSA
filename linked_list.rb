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

  def append(value)
      #adds new node containing value to end of the list
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

  def prepend(value)
    # adds a new node containing value to the start of the list
    new_node = Node.new(value, @head)
    new_node.next_node = @head
    @head = new_node
  end

  # def size
  #   # returns the total number of nodes in the list
  # end

  # def head
  #   # returns the first node in the list

  # end

  # def tail
  #   # returns the last node in the list

  # end

  # def at(index)
  #   # returns the node at the given index

  # end

  # def pop
  #   # removes the last element from the list

  # end

  # def contains?(value)
  #   # returns true if the passed in value is in the list and otherwise returns false.

  # end

  # def find(value)
  #   # returns the index of the node containing value, or nil if not found.

  # end

  def to_s
    # represent your LinkedList objects as strings, so you can print them out and preview them in the console. The format should be: ( value ) -> ( value ) -> ( value ) -> nil
    current = @head
    while current != nil
      print "(#{current.value}) -> "
      current = current.next_node
    end
    print "(nil)"
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
