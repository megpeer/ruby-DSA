# def fibs(i)
#   fibonacci = [0]
#   x = 1
#   integer = 0
#   i.times do
#     fibonacci << x
#     x = x + fibonacci[integer]
#     integer += 1
#   end
#   p fibonacci
# end


def fibs_rec(n)
  return n if n <= 1
      puts "This was printed recursively"
    fibs_rec( n - 1 ) + fibs_rec( n - 2 )

end


puts fibs_rec(8)
# fibs(8)
