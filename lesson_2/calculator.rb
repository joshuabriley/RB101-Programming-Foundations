puts "Simple calculator"
puts "Enter the first number:"
first = gets.chomp.to_f
puts "Enter the second number:"
second = gets.chomp.to_f
puts "Enter the operation:"
operation = gets.chomp
case operation
when '+'
  puts "Result: #{first + second}"
when '-'
  puts "Result: #{first - second}"
when '*'
  puts "Result: #{first * second}"
when '/'
  puts "Result: #{first / second}"
else
  puts "Unknown operation"
end
