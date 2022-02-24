def prompt(message)
  puts("=> #{message}")
end

GAMES = {
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

VALID_GAME_TITLES = []
VALID_GAME_SHORTCUTS = GAMES.values.map { |game| game['shortcut'] }

prompt("Welcome to Rock, Paper, Scissors, Lizard, Spock!")
prompt("First to 3 wins!")
prompt("Whould you like to read the instructions for the game?")

instructions_answer = gets.chomp.delete(' ')
if instructions_answer.downcase.start_with?('y')
  puts `clear`
  INSTRUCTIONS = GAMES.map { |title, game| "#{title.capitalize} beats #{game['beats'].join(' and ')}." }
  puts INSTRUCTIONS
end

GAMES.each do |key, _|
  VALID_GAME_TITLES.push(key.to_s)
end

def win?(first, second)
  GAMES[first]['beats'].include?(second)
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

loop do
  choice = ''

  loop do
    prompt("Choose one: #{VALID_GAME_TITLES.join(', ')}")
    choice = gets.chomp.downcase().delete(' ')

    if VALID_GAME_TITLES.include?(choice) || VALID_GAME_SHORTCUTS.include?(choice)
      GAMES.each do |key, value|
        if value['shortcut'] == choice
          choice = key
        end
      end
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_GAME_TITLES.sample

  prompt("You chose: #{choice}; Computer chose: #{computer_choice}")

  display_results(choice, computer_choice)

  if win?(choice, computer_choice)
    player_win_count += 1
  elsif win?(computer_choice, choice)
    computer_win_count += 1
  end

  if player_win_count + computer_win_count == 5
    break
  else
    prompt("Do you want to play again? (y or n)")
    answer = gets.chomp.delete(' ')
    break unless answer.downcase.start_with?('y')
  end
end

puts `clear`
player_win_count > computer_win_count ? prompt("You won the game!") : prompt("Computer won the game.")
prompt("Player Score: #{player_win_count}")
prompt("Computer Score: #{computer_win_count}")
prompt("Thank you for playing. Good bye!")
