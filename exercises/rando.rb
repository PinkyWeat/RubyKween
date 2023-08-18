# Game about guessing secret number.
# Solution's aimed to be done fast, not great.

print "Would you like to play a game? "
response = gets.chomp

secret_number = rand(100)
counter = 0

while response != secret_number && counter < 3
  counter += 1
  print "What's my secret number? "
  response = gets.chomp.to_i
end
result = counter > 2 ? "lost" : "won"
puts "You #{result}, random number was #{secret_number}"
