=begin
  1. Get input from the user for the first operand.
    a. validate the input
      1. if invalid, prompt the user to enter valid input
  2. Get input from the user for the second operand.
    a. validate the input
      1. if invalid, promot the user to enter valid input
  3. Get input from the user for the operation.
    a. validate the operation
      1. if invalid, promot the user to enter valid input
  4. Perform the calculation on the numbers based on the user input operation
=end
require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def prompt_text(message)
  puts("=> #{message}")
end

def valid_number?(number)
  number.length > 0 && !number.match(/[^0-9.]/) && number.match(/.$/)
end

def calculate(number1_string, number2_string, operator_string)
  number1 = number1_string.to_f
  number2 = number2_string.to_f
  operator = operator_string.to_f

  case operator
  when 1 then number1 + number2
  when 2 then number1 - number2
  when 3 then number1 * number2
  when 4 then number1 / number2
  end
end

number_one = ''
loop do
  prompt_text(MESSAGES["valid_number"])
  number_one = gets.chomp
  break if valid_number?(number_one)
  prompt_text(MESSAGES["invalid_number"])
end

number_two = ''
loop do
  prompt_text(MESSAGES["valid_number"])
  number_two = gets.chomp
  break if valid_number?(number_two)
  prompt_text(MESSAGES["invalid_number"])
end

prompt_text(MESSAGES["operator_prompt"])

operator = ''
loop do
  operator = gets.chomp
  break if %w(1 2 3 4).include?(operator)
  prompt_text(MESSAGES["valid_operator"])
end

output = calculate(number_one, number_two, operator)

puts "The result is #{output}"
