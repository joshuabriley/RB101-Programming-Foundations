require 'yaml'
DATA = YAML.load_file('mortgage_data.yml')
LANGUAGE = DATA['language']

def prompt(message)
  puts "=> #{DATA[LANGUAGE][message]}"
end

def integer?(number)
  number.to_i.to_s == number && number.to_i != 0
end

def float?(number)
  number.to_f.to_s == number && number.to_f != 0
end

def get_number
  gets.chomp.delete(' ').delete('$').delete('%').delete(',')
end

def get_integer
  number = ''
  loop do
    number = get_number
    break if integer?(number)
    prompt('invalid_number')
  end
  number
end

def get_float
  number = ''
  loop do
    number = get_number
    break if float?(number) || integer?(number)
    prompt('invalid_number')
  end
  number
end

prompt("welcome")
loop do
  prompt("loan_amount")
  loan_amount = get_integer

  puts loan_amount

  prompt("apr")
  apr = get_float
  puts apr

  prompt("duration")
  duration = get_integer
  puts duration

  # calculate the monthly interest rate
  # return APR / 12

  monthly_interest_rate = (apr.to_f / 100) / 12

  # calculate the loadn duration in months
  # return loan duration * 12

  loan_duration_in_months = duration.to_i * 12

  # determine the monthly payment
  monthly_payment =
    loan_amount.to_f * (monthly_interest_rate / (1 - (1 + monthly_interest_rate)**(-loan_duration_in_months)))

  prompt("monthly_payment")
  puts "=> $#{monthly_payment.round(2)}"

  prompt("repeat_calculation")
  answer = gets.chomp.downcase
  break if answer != 'y'
end
