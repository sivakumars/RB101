=begin
  # Input
  ## the loan amount
  ## the Annual Percentage Rate (APR)
  ## the loan duration

  # Calculate
  ## monthly interest rate
  ## loan duration in months
  ## monthly payment, M = P * ( J / (1 - (1+J)**(-N)) )

  # P = Loan amount; J = monthly interest rate; N = loan duration in months
=end

def valid_number?(number)
  number.length > 0 && !number.match(/[^0-9.]/) && !number.match(/^\.$/)
end

def positive?(number)
  number.to_f > 0
end

def prompt_message(message)
  puts(">> #{message}")
end

loop do
  loan_amount = ''
  loop do
    prompt_message("Enter a valid loan amount: ")
    loan_amount = gets.chomp
    break if valid_number?(loan_amount) && positive?(loan_amount)
    prompt_message("Invalid number! Please enter a valid loan amount")
  end

  annual_percentage_rate = ''
  loop do
    prompt_message("Enter the annual percentage rate. e.g., 10 for 10%; 10.5 for 10.5% : ")
    annual_percentage_rate = gets.chomp
    break if valid_number?(annual_percentage_rate) && positive?(annual_percentage_rate)
    prompt_message("Invalid percentage rate. Please enter a valid rate")
  end

  loan_duration = ''
  loop do
    prompt_message("Enter the loan duration in years: ")
    loan_duration = gets.chomp
    break if valid_number?(loan_duration) && positive?(loan_duration)
    prompt_message("Invalid loan duration. Please enter a valid duration")
  end

  puts "#{loan_amount} #{annual_percentage_rate} #{loan_duration}"

  monthly_interest_rate = (annual_percentage_rate.to_f) / 12 / 100
  loan_duration_in_months = (loan_duration.to_f) * 12

  monthly_payment_rate = loan_amount.to_f * 
                         (monthly_interest_rate /
                         (1 - (1 + monthly_interest_rate)**(-loan_duration_in_months)))

  puts "Monthly payment rate: #{monthly_payment_rate.round(2)}"

  prompt_message("Do you want to calculate again? Enter Y to calculate again and any key to exit: ")
  repeat_calculation = gets.chomp

  break unless repeat_calculation.downcase.start_with?('y')
end
