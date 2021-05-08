require 'pry'

PLAYERS = { 1 => 'player', 2 => 'computer' }
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                [[1, 5, 9], [3, 5, 7]]              # diagonals
WINNING_SCORE = 5

def prompt(msg)
  puts "=> #{msg}"
end

def display_board(brd)
  system 'clear'
  puts "You're a #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |   #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |   #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |   #{brd[9]}"
  puts "     |     |"
  puts ""
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def welcome
  start = ''
  loop do
    prompt "Welcome to Tic-Tac-Toe"
    prompt "Who would you like to go first? (1) player or (2) computer"
    start = gets.chomp.to_i
    break if start.between?(1, 2)
  end
  start
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def place_piece!(brd, player)
  if player == 'player'
    player_place_piece!(brd)
  else
    computer_places_piece!(brd)
  end
end

def alternate_player(player)
  case player
  when 'player'
    'computer'
  when 'computer'
    'player'
  end
end

def player_place_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square: #{joinor(empty_squares(brd))}"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choive."
  end
  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  square = nil

  # first offense
  WINNING_LINES.each do |line|
    square = find_optimal_square(line, brd, COMPUTER_MARKER)
    break if square
  end

  # then defense
  if !square
    WINNING_LINES.each do |line|
      square = find_optimal_square(line, brd, PLAYER_MARKER)
      break if square
    end
  end

  if !square
    return square = 5 if empty_squares(brd).include?(5)
  end

  if !square
    square = empty_squares(brd).sample
  end

  brd[square] = COMPUTER_MARKER
end

def find_optimal_square(line, brd, marker)
  if brd.values_at(*line).count(marker) == 2
    brd.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  else
    nil
  end
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(line[0], line[1], line[2]).count(PLAYER_MARKER) == 3
      return 'player'
    elsif brd.values_at(line[0], line[1], line[2]).count(COMPUTER_MARKER) == 3
      return 'computer'
    end
  end
  nil
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def joinor(squares, delim = ', ', conj = 'or')
  case squares.size
  when 0 then ''
  when 1 then squares.first
  when 2 then squares.join(" #{conj} ")
  else
    squares[-1] = "#{conj} #{squares.last}"
    squares.join(delim)
  end
end

def track_score(scoreboard, winner)
  scoreboard[winner.to_sym] += 1 unless winner.nil?
end

score = { 'player': 0, 'computer': 0 }
loop do
  board = initialize_board
  current_player = PLAYERS[welcome]

  loop do
    display_board(board)
    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)

  if someone_won?(board)
    winner = detect_winner(board)
    prompt "#{winner} won!"
    track_score(score, winner)
  else
    prompt "It's a tie!"
  end

  prompt("Score is Player: #{score[:Player]} - Computer: #{score[:Computer]}")

  if score.value?(2)
    puts "#{score.key(2).to_s.capitalize} is the grand winner!"
  end

  prompt "Play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase == 'y'
end

prompt "Thanks for playing tic-tac-toe. Goodbye!"
