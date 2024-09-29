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
    puts "hash code for #{key} is #{hash_code}"
    return hash_code
    
  end

  # takes two arguments, the first is a key and the second is a value that is assigned to this key. If a key already exists, then the old value is overwritten or we can say that we update the key’s value
  def set(key, value)
    
    index = hash(key)
    puts "index for #{key} is #{index}"
    @bucket[index] = [key, value]
    @size += 1
    puts "#{@bucket}"
  
  end

  # takes one argument as a key and returns the value that is assigned to this key. If key is not found, return nil.
  def get(key)
    index = hash(key)
    item = @bucket[index]
    if item[0] == key
      val = item[1]
      puts "the value assigned to key '#{key}' is '#{val}'"
    else
      puts "the value assigned to key '#{key}' is nil"
    end
   

  end

  # takes a key as an argument and returns true or false based on whether or not the key is in the hash map.
  def has?(key)
    index = hash(key)
    item = @bucket[index]
    if item[0] == key
      puts "true"
    else
      puts "false"
    end    
  end

  # takes a key as an argument. If the given key is in the hash map, it should remove the entry with that key and return the deleted entry’s value. If the key isn’t in the hash map, it should return nil.
  def remove(key)
    
  end

  # returns the number of stored keys in the hash map.
  def length
    
  end

  # removes all entries in the hash map.
  def clear
    
  end

  # returns an array containing all the keys inside the hash map.
  def keys

  end

  # returns an array containing all the values.
  def values

  end

  # returns an array that contains each key, value pair. Example: [[first_key, first_value], [second_key, second_value]]
  def entries
    
  end
end

test = HashMap.new
test.set('pig', 'goat')

test.set('pig', 'banana')
test.get('pig')
test.get('scrooge')

test.has?('pig')
test.has?('scrooge')