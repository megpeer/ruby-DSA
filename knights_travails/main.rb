#required data
#representation of the graph
#array to keep track of path cost
#array to keep track of previous vertex
#   needed to construct the actual path
#array to keep track of wether we've found a path to that vertex 
#a q
#
#what goes in q:
#-vertex we just reached
#-vertex we came from
#total cost of path to the vertex (number of edges back to the starting vertex)
#
#
#process:
#add all vertices directly connected to the source to the qeue
#while q is not empty, and there are vertices we dont have paths to:
#   -take 1st item off the q
#   -if there is not yet a path to that vertex
#       -update arrays
#         -for each edge out of the vertex
#           -if there is not path to the ending vertex yet
#             - add that vertex information to the q
#             
#
#finding the path
#work backwards from the destination to reach the source
#reverse the sequences of vertices to get the path
#
require_relative "knight"

Board.new([3, 3], [4, 3])
puts ""
Board.new([0, 0], [3, 3])
puts ""
Board.new([3, 3], [0, 0])