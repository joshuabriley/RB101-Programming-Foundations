require 'yaml'
DATA = YAML.load_file('mortgage_data.yml')

LANGUAGE = 'english'

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

prompt("welcome")
loop do
  # Get the loan amount from the user
  # validate the amount is a float
  # save the loan amount to a variable

  loan_amount = ''

  loop do
    prompt("loan_amount")
    loan_amount = get_number
    break if float?(loan_amount) || integer?(loan_amount)
    prompt("invalid_number")
  end

  # Get the APR from the user
  # validate the amount is a float
  # save the APR to a variable

  apr = ''

  loop do
    prompt("apr")
    apr = get_number
    break if float?(apr) || integer?(apr)
    prompt("invalid_number")
  end

  # Get the loan duration from the user
  # validate the amount is an integer
  # save the load duration to a variable

  duration = ''

  loop do
    prompt("duration")
    duration = get_number
    break if integer?(duration)
    prompt("invalid_number")
  end

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
