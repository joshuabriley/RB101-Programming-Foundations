def prompt(message)
  puts("=> #{message}")
end

CHOICES = {
  'rock' => {
    'shortcut' => 'r',
    'beats' => %w(scissors lizard)
  },
  'paper' => {
    'shortcut' => 'p',
    'beats' => %w(rock spock)
  },
  'scissors' => {
    'shortcut' => 's',
    'beats' => %w(paper lizard)
  },
  'lizard' => {
    'shortcut' => 'l',
    'beats' => %w(paper spock)
  },
  'spock' => {
    'shortcut' => 'sp',
    'beats' => %w(rock scissors)
  }
}

def valid_choice?(choice)
  CHOICES.keys.include?(choice) ||
    CHOICES.values.map { |value| value['shortcut'] }.include?(choice)
end

def visual_separator
  puts(" ")
  puts("=" * 80)
  puts(" ")
end

def win?(first, second)
  CHOICES[first]['beats'].include?(second)
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won the round!")
  elsif win?(computer, player)
    prompt("Computer won the round.")
  else
    prompt("It's a tie.")
  end
end

player_win_count = 0
computer_win_count = 0
round = 1
user_quit = false

prompt("Welcome to #{CHOICES.keys.to_a.join(', ').capitalize}!")
prompt("First to 3 wins!")

prompt("Would you like to read the instructions for the game? (y)")
instructions_answer = gets.chomp.delete(' ')
if instructions_answer.downcase.start_with?('y')
  puts `clear`
  prompt("GAME INSTRUCTIONS:")
  INSTRUCTIONS = CHOICES.map do |title, game|
    "=> #{title.capitalize} beats #{game['beats'].join(' and ')}.
    Choose #{title.capitalize} by typing '#{title}' or '#{game['shortcut']}'."
  end
  puts INSTRUCTIONS
end

visual_separator

loop do
  prompt("STARTING ROUND #{round}")
  choice = ''

  loop do
    prompt("Choose one: #{CHOICES.keys.to_a.join(', ')}")
    choice = gets.chomp.downcase().delete(' ')

    if valid_choice?(choice)
      CHOICES.each do |key, value|
        if value['shortcut'] == choice
          choice = key
        end
      end
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = CHOICES.keys.sample

  prompt("You chose #{choice}. Computer chose #{computer_choice}")

  display_results(choice, computer_choice)

  if win?(choice, computer_choice)
    player_win_count += 1
  elsif win?(computer_choice, choice)
    computer_win_count += 1
  end

  if player_win_count == 3 || computer_win_count == 3
    break
  else
    prompt("Continue playing? (y or n)")
    answer = gets.chomp.delete(' ')
    if answer.downcase.start_with?('y')
      visual_separator
      prompt("Round #{round} sore:
        => You: #{player_win_count}
        => Computer: #{computer_win_count}")
      round += 1
      visual_separator
    else
      user_quit = true
      break
    end
  end
end

puts `clear`

if !user_quit
  if player_win_count > computer_win_count
    prompt("You won the game!")
  else
    prompt("Computer won the game.")
  end

  prompt("Player Score: #{player_win_count}")
  prompt("Computer Score: #{computer_win_count}")
  prompt("Thank you for playing. Good bye!")
else
  prompt("The computer accepts your forfeiture and claims the victory.")
end
