def prompt(message)
  puts "=> #{message}"
end

def valid_number?(number)
  number.to_i != 0
end

prompt("Welcome to Calculator!")

name = ""

loop do
  prompt("What is your name?")
  name = gets.chomp
  break if !name.empty?
end

prompt("Hi #{name}!")

loop do
  first = ''

  loop do
    prompt("What's the first number?")
    first = gets.chomp.to_f
    if valid_number?(first)
      break
    else
      prompt('Invalid number!')
    end
  end

  second = ''
  loop do
    prompt("What's the second number?")
    second = gets.chomp.to_f
    if valid_number?(second)
      break
    else
      prompt('Invalid number!')
    end
  end

  operation = ''
  prompt("What operation would you like to perform? +, -, *, or /")
  loop do
    operation = gets.chomp
    if %w(+ - * /).include?(operation)
      break
    else
      prompt('Must choose +, -, *, or /')
    end
  end

  def operation_type(operator)
    case operator
    when "+"
      'Adding'
    when "-"
      'Subtracting'
    when "*"
      'Multiplying'
    when "/"
      'Dividing'
    end
  end

  result =  case operation
            when '+'
              first + second
            when '-'
              first - second
            when '*'
              first * second
            when '/'
              first / second
            end

  puts "#{operation_type(operation)} the two numbers..."
  puts result

  prompt("Do you want to perform another calculation? (Y to calculate again)")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end
