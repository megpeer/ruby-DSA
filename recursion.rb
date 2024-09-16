#FACTORIAL

# def fact(n)
#   if n == 1
#     return n
#   else 
#     n * fact(n-1)
#   end
# end

# puts fact(3)

#PALINDROME

# def pal(str)
#   if str.length <= 1
#     return true
#   else
#     if
#     str[0] == str [-1]
#     pal(str[1..-2])
#     else 
#       false
#     end
#   end
# end

# puts pal('friend')
# puts pal('a')
# puts pal('hannah')

##ALCHOHOLISM

# def bottles(n)
#   if n == 0 
#     puts "no more bottles of beer on the wall"
#   else
#     puts "#{n} bottles of beer on the wall!"
#     bottles(n-1)
#   end
# end

# bottles(99)

##FIBBONACCI


# def fib(n)
#   if n == 0
#     0
#   elsif n == 1
#     1
#   else 
#     fib(n-1) + fib(n-2)
#   end
# end

# puts fib(5)

##ARRAY FLATTEN

# def flatten(array, new_array = [])
#   array.each do |element|
#   if element.kind_of?(Array)
#     flatten(element, new_array)
#   else new_array << element
#   end
# end
# return puts new_array
# end


# flatten([[1, [8, 9]], [3, 4]])

##ROMAN_NUMERAL

# roman_mapping = {
#   1000 => "M",
#   900 => "CM",
#   500 => "D",
#   400 => "CD",
#   100 => "C",
#   90 => "XC",
#   50 => "L",
#   40 => "XL",
#   10 => "X",
#   9 => "IX",
#   5 => "V",
#   4 => "IV",
#   1 => "I"
# }

# def romanize(roman_mapping, int, numeral = "")
#   return numeral if int == 0
#   roman_mapping.keys.each do |poo|
#   quotient, modulus = int.divmod(poo)
#   numeral << roman_mapping[poo] * quotient
#   return romanize(roman_mapping, modulus, numeral) if quotient > 0
#   end
# end

# puts romanize(roman_mapping, 1234)

##ROMAN NUMERAL 2

roman_mapping = {
  "M" => 1000,
  "CM" => 900,
  "D" => 500,
  "CD" => 400,
  "C" => 100,
  "XC" => 90,
  "L" => 50,
  "XL" => 40,
  "X" => 10,
  "IX" => 9,
  "V" => 5,
  "IV" => 4,
  "I" => 1
}

def de_romanize(roman_mapping, numeral, int = 0)
  return int if numeral.empty?
  roman_mapping.keys.each do |k|
    if numeral.start_with?(k)
      int += roman_mapping[k]
      numeral = numeral.slice(k.length, numeral.length)
      return de_romanize(roman_mapping, numeral, int)
    end
  end
end

puts  de_romanize(roman_mapping, "MCCXXXIV")