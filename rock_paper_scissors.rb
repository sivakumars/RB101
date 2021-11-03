=begin
  # Prompt the user to enter an input from given choices
    a. Validate the user choice
  # Assign a computer choice
  # compare the user choice with the computer choice
  # display results
  Lizard Spock

Typing the full word "rock" or "lizard" is tiring. 
Update the program so the user can type "r" for "rock," "p" for "paper," etc. 
Note that if you do bonus #1, you'll have two words that start with "s." How do you resolve that?

Keep score of the player's and computer's wins. 
When either the player or computer reaches three wins, the match is over, and the winning player becomes the grand winner. 
Don't add your incrementing logic to display_results. Keep your methods simple; 
they should perform one logical task — no more, no less.
=end
VALID_CHOICES = {
  r: 'rock',
  p: 'paper',
  sc: 'scissors',
  sp: 'spock',
  l: 'lizard'
}

$player_stats = {
  user: 0,
  computer: 0
}

def print_text(message, prompt = false)
  prompt ?  puts(">> #{message}") : puts("\n#{message}")
end

def display_wait
  print "wait...."
  sleep(1)
end

def display_choices
  print_text("Available choices: ")
  VALID_CHOICES.each_with_index{ |(key, value), index| puts " #{index+1}.#{key} (#{value})"}
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
    print_text('You won!')
  elsif winner?(computer, player, 'computer')
    print_text('Computer won :(')
  else
    print_text("It's a tie")
  end
end

loop do
  display_choices
  while $player_stats.values.max < 3
    print_text("Make a choice: ", true)
    
    user_choice = ''
    loop do
      user_choice = gets.chomp
      break if valid_choice?(user_choice)
      print_text("You entered an invalid choice")
    end

    computer_choice = VALID_CHOICES.keys.sample

    user_choice_value = get_symbol_value(user_choice) || ""
    computer_choice_value = get_symbol_value(computer_choice) || ""

    print_text("Your choice: #{user_choice_value}; Computer's choice: #{computer_choice_value}")
    display_results(user_choice_value,computer_choice_value)
  end

  grand_winner = $player_stats.key($player_stats.values.max).to_s
  print_text("The grand winner is: #{grand_winner.capitalize!}")
  
  print_text("Do you want to play again? Press 'y' to play again ", true)
  play_again = gets.chomp
  if play_again.downcase.start_with?('y')
    $player_stats.each{|key, value| $player_stats[key] = 0}
    system("cls") || system("clear")
  else
    break
  end
end

print_text("Thank you for playing!")
