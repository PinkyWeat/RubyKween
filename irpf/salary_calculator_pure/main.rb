require_relative 'models/user'
require_relative 'logic/calculator'

print "Enter your name: "
name = gets.chomp
print "Enter your net salary: "
net_salary = gets.chomp
print "Enter your family status: "
family_status = gets.chomp
# Creates a user instance
user = User.new(name, net_salary.to_f, family_status.to_i)

puts "#{user.name}, that's your name, also this is the salary you put #{user.net_salary}, also your family status is #{user.family_status}"

print "now here comes your salary after taxes, are you ready?"
response = gets.chomp
sad_salary = Calculator.calculate_salary(net_salary, family_status)
puts "Here's your salary: #{sad_salary}"
