require_relative 'models/user'
require_relative 'logic/calculator'

print "Enter your name: "
name = gets.chomp
print "Enter your net salary: "
net_salary = gets.chomp

# Creates a user instance
user = User.new(name, net_salary.to_f)

puts "#{user.name}, that's your name, also this is the salary you put #{user.net_salary}"

print "now here comes your salary after taxes, are you ready?"
response = gets.chomp
sad_salary = Calculator.calculate_salary(net_salary)
puts "Here's your salary: #{sad_salary}"
