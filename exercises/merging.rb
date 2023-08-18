# Merge: With a Block

h1 = {:a => 2, :b => 4, :c => 6}
h2 = {:a => 3, :b => 4, :d => 8}

puts "Here's before stuff happens.\nh1: #{h1} - h2: #{h2}"

x = h1.merge(h2) {|key, old, new| new}
y = h2.merge(h1) {|key, old, new| old}

puts "Here's after stuff happens.\nh1: #{x} - h2: #{y}"
