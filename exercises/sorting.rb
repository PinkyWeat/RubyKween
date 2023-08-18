# Sorting here is amazing

array = [5, 8, 2, 6, 1, 3]

x = array.sort {|v1, v2| v1 <=> v2}

puts "Array sorted with |v1, v3| v1 <=> v2: #{x}"

x = array.sort {|v1, v2| v2 <=> v1}

puts "Array sorted with |v1, v2| v2 <=> v1: #{x}"
