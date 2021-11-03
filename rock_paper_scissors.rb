=begin
=end
VALID_CHOICES = {
  r: 'rock',
  p: 'paper',
  sc: 'scissors',
  sp: 'spock',
  l: 'lizard'
}

BEATABLE_MOVES = {
  rock: ['scissors', 'lizard'],
  paper: ['rock', 'spock'],
  scissors: ['paper', 'lizard'],
  spock: ['rock', 'scissors'],
  lizard: ['paper', 'spock']
}

MAX_WINS = 3

def print_text(message, prompt = false)
  prompt ? puts(">> #{message}") : puts(message)
end

def display_delay(message = 'wait...')
  print_text(message)
  sleep(1)
end

def display_choices_list
  print_text("Available choices: ")
  VALID_CHOICES.each_with_index do |(key, value), index|
    print_text(" #{index + 1}. #{key} (#{value})")
  end
end

def choices_keys
  VALID_CHOICES.keys.join(', ')
end

def valid_choice?(choice)
  VALID_CHOICES.keys.include?(choice)
end

def get_symbol_value(key)
  VALID_CHOICES[key.to_sym]
end

def update_stats(stats, key)
  stats[:rounds] += 1
  if key
    stats[key.to_sym] += 1
  end
end

def reset(stats_hash)
  stats_hash.each { |key, _| stats_hash[key] = 0 }
end

def winner?(first, second)
  BEATABLE_MOVES[first.to_sym].include?(second)
end

def determine_winner(user, computer)
  if winner?(user, computer)
    "user"
  elsif winner?(computer, user)
    "computer"
  end
end

def get_player_stats(stats)
  stats.select { |key, _| key != :rounds }
end

def determine_grand_winner(stats)
  stats.key(get_player_stats(stats).values.max)
end

def next_round?(stats)
  get_player_stats(stats).values.max < MAX_WINS
end

def display_results(winner, name)
  if winner == 'user'
    print_text("+++ #{name} won! +++")
  elsif winner == 'computer'
    print_text('+++ Computer won :( +++')
  else
    print_text("+++ It's a tie +++")
  end
end

user_name = ''
loop do
  print_text("Enter your name: ")
  user_name = gets.chomp
  break if user_name.length > 2 && user_name.match(/[a-zA-Z]/)
  print_text("Please enter a valid name atleast 3 characters long")
end
user_name.capitalize!

game_stats = {
  user: 0,
  computer: 0,
  rounds: 0
}
loop do
  display_choices_list
  while next_round?(game_stats)
    user_choice = ''
    loop do
      print_text("#{user_name}, Make a choice(#{choices_keys}): ", true)
      user_choice = gets.chomp
      break if valid_choice?(user_choice.to_sym)
      print_text("You entered an invalid choice")
    end

    computer_choice = VALID_CHOICES.keys.sample

    user_choice_value = get_symbol_value(user_choice) || "<No value>"
    computer_choice_value = get_symbol_value(computer_choice) || "<No value>"

    print_text("********************************************")
    print_text("ROUND: ##{game_stats[:rounds] + 1}")
    print_text("#{user_name}'s choice: #{user_choice_value}")
    print_text("Computer's choice: #{computer_choice_value}")

    display_delay("Determining the winner...")

    winner = determine_winner(user_choice_value, computer_choice_value)
    update_stats(game_stats, winner)

    display_results(winner, user_name)
    print_text("********************************************")
  end

  grand_winner = determine_grand_winner(game_stats).to_s
  if grand_winner == 'user'
    grand_winner = user_name
  end
  print_text("The grand winner is: #{grand_winner.upcase}")

  print_text("Do you want to play again? Press 'y' to play again ", true)
  play_again = gets.chomp
  if play_again.downcase.start_with?('y')
    reset(game_stats)
    system("cls") || system("clear")
  else
    break
  end
end

print_text("Thank you for playing, #{user_name}!")
