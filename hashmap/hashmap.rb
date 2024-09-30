#snippet to use whenever accessing buckets through an index:
#  raise IndexError if index.negative? || index >= @buckets.length


class HashMap
  attr_accessor :bucket
  def initialize
    @bucket = Array.new(16) {[]}
    @size = 0
  end

  class Node
      attr_accessor :key, :value, :next_node
      def initialize(key, value, next_node)
        @key = key
        @value = value
        @next_node = nil
      end
  end

  def hash(key)
    hash_code = 0
    prime_number = 31
       
    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }
    hash_code = hash_code % bucket.size
    return hash_code
    
  end

  #adds a key value pair ot the hashmap
  def set(key, value)
    # length
    # load_factor = @size
    index = hash(key)
    @bucket[index] = [key, value]
  end

  # returns the value of a given key. returns nil if key doesnt exist
  def get(key)
    index = hash(key)
    item = @bucket[index]
    if item[0] == key
      val = item[1]
      puts "the value assigned to key '#{key}' is '#{val}'"
    else
      val = nil
      puts "the value assigned to key '#{key}' is nil"
    end
  end

  # checks if the hashmap contains a given key
  def has?(key)
    index = hash(key)
    item = @bucket[index]
    if item[0] == key
      puts "true"
    else
      puts "false"
    end    
  end

  #removes the value from the key.
  def remove(key)
    index = hash(key)
    item = @bucket[index]
        if item[0] == key
          item.delete_at(1)
        end
        puts "bucket = #{@bucket[index]}"
  end

  # returns the number of stored keys in the hash map.
  def length
    @bucket.each do |x| 
      if x != [] then @size += 1
      end
    end
        puts "the size of the hashmap is #{@size}"
        load_factor = (@size.to_f / @bucket.length.to_f)
        puts "the load factor of the hashmap is #{load_factor}"
  end

  # removes all entries in the hash map.
  def clear
    @bucket.each do |x| 
      x == []
    end
  end

  # returns an array containing all the keys inside the hash map.
  def keys
    keys = []
    @bucket.each do |x| 
      if x != [] then keys.append(x[0])
      end
    end
    puts "the list of keys in the hashmap is #{keys}"
  end

  # returns an array containing all the values.
  def values
    values = []
    @bucket.each do |x| 
      if x != [] then values.append(x[1])
      end
    end
    puts "the list of values in the hashmap is #{values}"
  end

  # returns an array that contains each key, value pair. Example: [[first_key, first_value], [second_key, second_value]]
  def entries
    entries = []
    @bucket.each do |x| 
      if x != [] then entries.append(x)
      end
    end
    puts "the list of entries in the hashmap is #{entries}"
  end
end

test = HashMap.new
test.set('apple', 'red')
test.set('banana', 'yellow')
test.set('carrot', 'orange')
test.set('dog', 'brown')
test.set('elephant', 'gray')
test.set('frog', 'green')
test.set('grape', 'purple')
test.set('hat', 'black')
test.set('ice cream', 'white')
test.set('jacket', 'blue')
test.set('kite', 'pink')
test.set('lion', 'golden')
test.set('moon', 'silver')
test.length
test.entries
