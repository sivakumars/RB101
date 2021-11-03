=begin
=end
VALID_CHOICES = {
  r: 'rock',
  p: 'paper',
  sc: 'scissors',
  sp: 'spock',
  l: 'lizard'
}

MAX_WINS = 3

$player_stats = {
  user: 0,
  computer: 0
}

def print_text(message, prompt = false)
  prompt ?  puts(">> #{message}") : puts(message)
end

def display_wait
  print_text("wait....")
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
  VALID_CHOICES.keys.include?(:"#{choice}")
end

def get_symbol_value(key)
  VALID_CHOICES[key.to_sym]
end

def update_wins(key)
  $player_stats[key.to_sym] += 1
end

def winner?(first, second, player)
  winner = case first
           when 'rock'
             ['scissors', 'lizard'].include?(second)
           when 'paper'
             ['rock', 'spock'].include?(second)
           when 'scissors'
             ['paper', 'lizard'].include?(second)
           when 'spock'
             ['rock', 'scissors'].include?(second)
           when 'lizard'
             ['paper', 'spock'].include?(second)
           end
  update_wins(player) if winner
  winner
end

def display_results(player, computer)
  display_wait
  if winner?(player, computer, 'user')
    print_text("+++ #{$user_name} won! +++")
  elsif winner?(computer, player, 'computer')
    print_text('+++ Computer won :( +++')
  else
    print_text("+++ It's a tie +++")
  end
end

$user_name = ''
loop do
  print_text("Enter your name: ")
  $user_name = gets.chomp
  break if $user_name.length > 2 && $user_name.match(/[a-zA-Z]/)
  print_text("Please enter a valid name atleast 3 characters long")
end
$user_name.capitalize!

loop do
  display_choices_list
  while $player_stats.values.max < MAX_WINS
    user_choice = ''
    loop do
      print_text("#{$user_name}, Make a choice(#{choices_keys}): ", true)
      user_choice = gets.chomp
      break if valid_choice?(user_choice)
      print_text("You entered an invalid choice")
    end

    computer_choice = VALID_CHOICES.keys.sample

    user_choice_value = get_symbol_value(user_choice) || "<No value>"
    computer_choice_value = get_symbol_value(computer_choice) || "<No value>"

    print_text("********************************************")
    print_text("#{$user_name}'s choice: #{user_choice_value}")
    print_text("Computer's choice: #{computer_choice_value}")
    print_text("********************************************")

    display_results(user_choice_value, computer_choice_value)
  end

  grand_winner = $player_stats.key($player_stats.values.max).to_s
  if grand_winner == 'user'
    grand_winner = $user_name
  end
  print_text("The grand winner is: #{grand_winner.upcase}")

  print_text("Do you want to play again? Press 'y' to play again ", true)
  play_again = gets.chomp
  if play_again.downcase.start_with?('y')
    $player_stats.each { |key, _| $player_stats[key] = 0 }
    system("cls") || system("clear")
  else
    break
  end
end

print_text("Thank you for playing!")
