#snippet to use whenever accessing buckets through an index:
#  raise IndexError if index.negative? || index >= @buckets.length


require_relative 'linked_list'
require_relative 'node'
class HashMap
  attr_accessor :bucket
  def initialize
    @capacity = 16
    @load_factor = 0.75
    @bucket = Array.new(@capacity) {LinkedList.new}
    @size = 0
  end

  #keygen for hashmap
  def hash(key)
    hash_code = 0
    prime_number = 31
       
    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }
    hash_code = hash_code % bucket.size
    return hash_code
    
  end

  #adds a key value pair ot the hashmap
  def set(key, value)
    expand if @capacity * @load_factor <= @size

    index = hash(key)
    @bucket[index].append(key, value)
    @size += 1
    puts "size is now  #{@size}"
  end

  # returns the value of a given key. returns nil if key doesnt exist
  def get(match)
    index = hash(match)
    @bucket[index].at(match)
  end

  # checks if the hashmap contains a given key
  def has?(key)
    index = hash(key)
    puts @bucket[index].contains?(key)
  end

  #removes the value from the key.
  def remove(key)
    index = hash(key)
    @bucket[inex].del
        
        puts "bucket = #{@bucket[index]}"
  end

  # returns the number of stored keys in the hash map.
  def length
        puts "the size of the hashmap is #{@size}"
        load_factor = (@size.to_f / @bucket.length.to_f)
        puts "the load factor of the hashmap is #{load_factor}"
        return load_factor
  end

  # removes all entries in the hash map.
  def clear
    @bucket = Array.new(@capacity) {LinkedList.new}
    puts "the hash map is cleared"
    p entries
  end

  # returns an array containing all the keys inside the hash map.
  def keys
    keys = []
      temp = collect_from_buckets(&:entries_to_array)
      temp.each do |k, v|
        keys << k
      end
         puts "the list of keys in the hashmap is #{keys}"
  end

  # returns an array containing all the values.
  def values
    values = []
      temp = collect_from_buckets(&:entries_to_array)
      temp.each do |k, v|
        values << v
    end
    puts "the list of values in the hashmap is #{values}"
  end


  #doubles the size of the hashmap if load factor exceeds .075
  def expand
    @capacity *= 2
    puts "capacity is now #{@capacity}"
    temp = Array.new(@capacity) {LinkedList.new}
        entries.each do |key, value|

          index = hash(key)
          temp[index].append(key, value)
          
        end
        @bucket = temp
  end


  def entries
    collect_from_buckets(&:entries_to_array)
  end

  def collect_from_buckets
    array = []

    @bucket.each do |bucket|
      array.concat(yield bucket)
    end

    array
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
# p test.entries
# test.values
# test.keys
# test.length
# test.clear
test.get("moon")
test.has?("moon")
test.has?("sun")