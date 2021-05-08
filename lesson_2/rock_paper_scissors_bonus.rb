VALID_CHOICES = %w(rock paper scissors lizard Spock)

RULES = { 'rock': ['scissors', 'lizard'],
          'paper': ['rock', 'Spock'],
          'scissors': ['paper', 'lizard'],
          'Spock': ['rock', 'scissors'],
          'lizard': ['Spock', 'paper'] }

ABBREVIATIONS = { 'r': 'rock',
                  'p': 'paper',
                  's': 'scissors',
                  'l': 'lizard',
                  'S': 'Spock' }

def prompt(message)
  puts("=> #{message}")
end

def win?(first, second)
  RULES[first.to_sym].include?(second)
end

def determine_winner(player, computer)
  if win?(player, computer)
    'player'
  elsif win?(computer, player)
    'computer'
  end
end

def display_result(winner)
  case winner
  when 'player'
    prompt("You win!")
  when 'computer'
    prompt("Computer won!")
  else
    prompt("It's a tie.")
  end
end

def track_score(scoreboard, winner)
  scoreboard[winner.to_sym] += 1 unless winner.nil?
end

score = { 'player': 0, 'computer': 0 }
loop do
  choice = ''
  loop do
    operator_instructions = <<-MSG
    Choose one of the following:
    rock (r)
    paper (p)
    scissors (s)
    lizard (l)
    Spock (S)
    MSG
    prompt(operator_instructions)
    choice = gets.chomp

    if VALID_CHOICES.include?(choice)
      break
    elsif ABBREVIATIONS.key?(choice.to_sym)
      choice = ABBREVIATIONS[choice.to_sym]
      break
    else
      prompt("Not a valid choice.")
    end
  end
  computer_choice = VALID_CHOICES.sample

  puts("You chose #{choice}; Computer chose #{computer_choice}")

  winner = determine_winner(choice, computer_choice)
  display_result(winner)

  track_score(score, winner)

  if score.value?(5)
    puts "#{score.key(5).to_s.capitalize} is the grand winner!"
    break
  end

  prompt('Do you want to play again?')
  answer = gets.chomp
  break unless answer.downcase == 'y'
end

prompt("Thank you for playing. Goodbye!")
