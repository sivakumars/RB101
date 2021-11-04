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

def prompt(message)
  puts(">> #{message}")
end

def display_results(loan_amount, monthly_amount, duration)
  if monthly_amount.nan? 
    monthly_amount = 0.0
  end
  puts("#{loan_amount} #{monthly_amount} #{duration}")
  puts("Loan amount: #{loan_amount.round(2)}")
  puts("Monthly payment rate: #{monthly_amount.round(2)}")
  puts("Total payable: #{(loan_amount + monthly_amount).round(2)}")
  puts("Total duration: #{duration.to_i} months")
end

loop do
  loan_amount = ''
  loop do
    prompt("Enter a valid loan amount: ")
    loan_amount = gets.chomp
    break if valid_number?(loan_amount) && positive?(loan_amount)
    prompt("Invalid number! Please enter a valid loan amount")
  end

  annual_percentage_rate = ''
  loop do
    prompt("Enter the annual percentage rate. e.g., 10 for 10%; 10.5 for 10.5% : ")
    annual_percentage_rate = gets.chomp
    break if valid_number?(annual_percentage_rate) #&& positive?(annual_percentage_rate)
    prompt("Invalid percentage rate. Please enter a valid rate")
  end

  loan_duration = ''
  loop do
    prompt("Enter the loan duration in years: ")
    loan_duration = gets.chomp
    break if valid_number?(loan_duration) && positive?(loan_duration)
    prompt("Invalid loan duration. Please enter a valid duration")
  end

  loan_amount = loan_amount.to_f
  annual_percentage_rate = annual_percentage_rate.to_f

  #puts "#{loan_amount} #{annual_percentage_rate} #{loan_duration}"

  monthly_interest_rate = annual_percentage_rate.to_f > 0 ? ((annual_percentage_rate.to_f) / 12 / 100) :  0.0
  loan_duration_in_months = (loan_duration.to_f) * 12

  #puts monthly_interest_rate
  monthly_payment_rate = loan_amount.to_f * 
                         (monthly_interest_rate /
                         (1 - (1 + monthly_interest_rate)**(-loan_duration_in_months)))


  display_results(loan_amount, monthly_payment_rate, loan_duration_in_months)
  #puts "Monthly payment rate: #{monthly_payment_rate.round(2)}"

  prompt("Do you want to calculate again? Enter Y to calculate again and any key to exit: ")
  repeat_calculation = gets.chomp

  break unless repeat_calculation.downcase.start_with?('y')
end
