require_relative "linked_list"


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