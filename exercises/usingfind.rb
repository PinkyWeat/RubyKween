pantry = {
  'apple' => 0,
  'banana' => 1,
  'pear' => 3
}

puts "This's what I have in the pantry: #{pantry}"

missing = pantry.find {|k, v| v == 0}

puts "This's what I'm missing: #{missing}"

# There's also .find_all, .select, any?, and so much more.
