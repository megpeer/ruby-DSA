class Node
  attr_accessor :key, :left, :right
  def initialize(key, left = nil, right = nil)
    @key = key
    @left = left
    @right = right
  end
end