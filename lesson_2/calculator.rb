require "json"
file = File.open('messages.json')
DATA = JSON.load file

def prompt(message)
  puts "=> #{message}"
end

prompt("English or Spanish?")

LANGUAGE = gets.chomp.downcase

def valid_number?(number)
  number.to_i != 0
end

prompt(DATA[LANGUAGE]["welcome"])

name = ''

loop do
  prompt(DATA[LANGUAGE]["name"])
  name = gets.chomp
  break if !name.empty?
end

prompt("#{DATA[LANGUAGE]["hi"]} #{name}!")

loop do
  first = ''

  loop do
    prompt(DATA[LANGUAGE]["first_number"])
    first = gets.chomp.to_f
    if valid_number?(first)
      break
    else
      prompt(DATA[LANGUAGE]["invalid_number"])
    end
  end

  second = ''
  loop do
    prompt(DATA[LANGUAGE]["second_number"])
    second = gets.chomp.to_f
    if valid_number?(second)
      break
    else
      prompt(DATA[LANGUAGE]["invalid_number"])
    end
  end

  operation = ''
  prompt(DATA[LANGUAGE]["operation_to_perform"])
  loop do
    operation = gets.chomp
    if %w(+ - * /).include?(operation)
      break
    else
      prompt(DATA[LANGUAGE]["must_choose_error_response"])
    end
  end

  def operation_type(operator)
    operation = case operator
                when '+'
                  DATA[LANGUAGE]["adding"]
                when '-'
                  DATA[LANGUAGE]["subtractice"]
                when '*'
                  DATA[LANGUAGE]["multiplying"]
                when '/'
                  DATA[LANGUAGE]["dividing"]
                end
    # Can put other code here, if necessary
    operation
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

  puts operation_type(operation) + ' ' + DATA[LANGUAGE]['the_two_numbers']
  puts result

  prompt(DATA[LANGUAGE]["repeat_operation"])
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end
