class Node
  attr_accessor :value, :key, :next_node
  def initialize(value, key, next_node)
    @value = value
    @key = key
    @next_node = nil
  end
end
