=begin
  # Prompt the user to enter an input from given choices
    a. Validate the user choice
  # Assign a computer choice
  # compare the user choice with the computer choice
  # display results
=end
VALID_CHOICES = ['rock', 'paper', 'scissors']

def test_method(param)
  prompt("This is a test method #{param}")
end

# test_method("before")
def prompt(message)
  puts ">> #{message}"
end

def win?(player_one, player_second)
  (player_one == 'rock' && player_second == 'scissors') ||
    (player_one == 'paper' && player_second == 'rock') ||
    (player_one == 'scissors' && player_second == 'paper')
end

def display_results(player, computer)
  if win?(player, computer)
    prompt('You won!')
  elsif win?(computer, player)
    prompt('Computer won :(')
  else
    prompt("It's a tie")
  end
end

loop do
  user_choice = ''
  loop do
    prompt("Make a choice: #{VALID_CHOICES.join(', ')}")
    user_choice = gets.chomp
    break if VALID_CHOICES.include?(user_choice)
    prompt("You entered an invalid choice")
  end

  computer_choice = VALID_CHOICES.sample

  puts "Your choice: #{user_choice}; Computer's choice: #{computer_choice}"

  display_results(user_choice, computer_choice)

  prompt("Do you want to play again? Press 'y' to play again ")
  play_again = gets.chomp
  break unless play_again.downcase.start_with?('y')
end

prompt("Thank you for playing!")
