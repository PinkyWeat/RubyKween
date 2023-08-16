require_relative 'models/user'

print "Enter your name: "
name = gets.chomp
print "Enter your net salary: "
net_salary = gets.chomp

# Creates a user instance
user = User.new(name, net_salary.to_f)

puts "#{user.name}, that's your name, also this is the salary you put #{user.net_salary}"
