require_relative "tree"


# test = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
# # # test.pretty_print
# test.insert(-10)
# test.insert(-11)
# test.insert(2)
# test.insert(-1)
# test.insert(-2)
# # test.insert (10)
# test.pretty_print
# # puts "level order traversal"
# # test.level_order
# # test.level_order.each {|x| puts "#{x}"}
# # puts "inorder traversal:"
# # puts "[1, 3, 4, 5, 7, 8, 9, 23, 67, 324, 6345]"
# # p test.inorder
# # puts "preorder traversal:"
# # puts"[8, 4, 1, 3, 5, 7, 67, 9, 23, 324, 6345]"
# # p test.preorder
# # puts "postorder traversal:"
# # puts "[3, 1, 7, 5, 4, 23, 9, 6345, 324, 67, 8]"
# # p test.postorder
# # puts test.depth(8)
# # puts test.depth(23)
# # puts test.height(4)
# # puts test.height(67)
# # puts test.height(8)
# # puts test.height(3)
# puts test.balanced?
# test.rebalance
# test.pretty_print
# puts test.balanced?
# 

test = Tree.new(Array.new(15) { rand(1..100) })
test.pretty_print
puts test.balanced?

puts "level order traversal"
test.level_order
puts "inorder traversal:"
p test.inorder
puts "preorder traversal:"
p test.preorder
puts "postorder traversal:"
p test.postorder

test.insert(101)
test.insert(102)
test.insert(103)
test.insert(104)
test.insert(105)
test.insert(106)
test.insert(107)
test.pretty_print
puts test.balanced?
test.rebalance
test.pretty_print


puts "level order traversal"
test.level_order
puts "inorder traversal:"
p test.inorder
puts "preorder traversal:"
p test.preorder
puts "postorder traversal:"
p test.postorder
