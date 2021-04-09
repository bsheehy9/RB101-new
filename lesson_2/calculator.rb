require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')
puts MESSAGES.inspect

def prompt(message)
  puts("=> #{message}")
end

def integer?(input)
  input.to_i.to_s == input
end

def float?(input)
  input.to_f.to_s == input
end

def valid_number?(num)
  integer?(num) || float?(num)
end

def operation_to_message(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

def messages(message, lang='en')
  MESSAGES[lang][message]
end

prompt(message('welcome', 'en'))
loop do
  name = ''
  loop do 
    name = gets.chomp
    if name.empty?
      prompt(message('valid_name', 'en'))
    else
      break
    end 
  end 

  prompt("Hello #{name}!")

  number_one = ''
  loop do
    prompt('What is the first number?')
    number_one = gets.chomp

    if valid_number?(number_one)
      break
    else
      prompt("Hmm... that deosn't look like a valid number")
    end
  end

  number_two = ''
  loop do
    prompt('What is the second number?')
    number_two = gets.chomp

    if valid_number?(number_two)
      break
    else
      prompt("Hmm... that deosn't look like a valid number")
    end 
  end

  operator_prompt = <<-MSG
  What operation would you like to perform?
    1.) Add
    2.) Subtract
    3.) Multiply
    4.) Divide
  MSG

  prompt(operator_prompt)
  operator =''
  loop do     
    operator = gets.chomp

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("Must choose 1, 2, 3 or 4")
    end
  end 

  prompt("#{operation_to_message(operator)} the two numbers...")

  result = case operator 
           when '1'
             number_one.to_i + number_two.to_i
           when '2'
             number_one.to_i - number_two.to_i
           when '3'
             number_one.to_i * number_two.to_i
           when '4'
             number_one.to_i / number_two.to_f
           end

  prompt("The result is #{result}")
  prompt("Would you like to use Calculator again? (Y to calculate again)")
  answer = gets.chomp
  break unless answer.downcase == 'y'
end