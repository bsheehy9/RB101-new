def prompt(message)
  puts("=> #{message}")
end 

prompt('Welcome to Mortgage Calculator!')

loop do
  prompt('What is your loan amount?')

  loan_amount = ''
  loop do
    loan_amount = gets.chomp
    if loan_amount.empty? || loan_amount.to_f <= 0
      prompt('Must enter a positive number.')
    else
      break
    end
  end

  prompt('What is your annual percentage rate (APR)?')
  prompt('Example: 5.2 for 5.2%')

  rate = ''
  loop do
    rate = gets.chomp
    if rate.empty? || rate.to_f < 0
      prompt('Must enter a positive number.')
    else
      break
    end
  end

  prompt('What is your loan duration (in months)?')

  months = ''

  loop do
    months = gets.chomp
    if months.empty? || months.to_i < 0
      prompt('Must enter a positive number.')
    else
      break
    end
  end

  annual_rate = rate.to_f / 100
  monthly_rate = annual_rate / 12

  monthly_payment = loan_amount.to_f * (monthly_rate.to_f / (1 - (1 + monthly_rate.to_i)**(-months.to_i)))

  prompt("Your monthly payment is: $#{format('%.2f', monthly_payment)}")

  prompt("Another calculation?")
  answer = Kernel.gets().chomp()

  break unless answer.downcase().start_with?('y')
end 

prompt("Thank you for using the Mortgage Calculator!")
prompt("Good bye!")