require 'pry'

VALID_DECISIONS = ['S', 'H']
SUITS = ['C', 'S', 'H', 'D']
VALUES = ['J', 'Q', 'K', 'A'] + (2..10).to_a.map(&:to_s)

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  new_deck = []
  SUITS.each do |suit|
    VALUES.each do |value|
      new_deck << [suit, value]
    end
  end
  new_deck
end

def deal_first_hand(deck)
  first_hand = {}
  player_hand = []
  2.times { player_hand << deck.delete_at(rand(deck.length)) }
  first_hand['player'] = player_hand
  dealer_hand = []
  2.times { dealer_hand << deck.delete_at(rand(deck.length)) }
  first_hand['dealer'] = dealer_hand
  first_hand
end

def display_hand(hand)
  hand.map { |card| card.join('') }.join(', ')
end

def hit!(deck, hand, player)
  hand[player] << deck.delete_at(rand(deck.length))
end

def detect_bust_or_blackjack(score)
  if score == 21
    'blackjack'
  elsif score > 21
    'bust'
  end
end

def bust_or_blackjack?(score)
  !!detect_bust_or_blackjack(score)
end

def correct_aces(score, numbers)
  numbers.select { |value| value == "A" }.count.times do
    score -= 10 if score > 21
  end
  # binding.pry
  score
end

def count_score(hand)
  # cards = [['H', '3'], ['S', 'Q'], ... ]
  values = hand.map { |card| card[1] }

  sum = 0
  values.each do |value|
    # binding.pry
    if value == "A"
      sum += 11
    elsif value.to_i == 0 # J, Q, K
      sum += 10
    else
      sum += value.to_i
    end
  end
  sum = correct_aces(sum, values)
end

loop do
  system 'clear'
  player_score = 0
  dealer_score = 0
  deck = initialize_deck
  hands = deal_first_hand(deck)
  prompt "The dealer has #{hands['dealer'][0].join('')}"

  loop do
    player_score = count_score(hands['player'])
    prompt "Your hand is #{display_hand(hands['player'])}\
            (Total #{player_score})"
    break if bust_or_blackjack?(player_score)
    prompt "Would you like to hit (H) or stay (S)?"
    decision = ''
    loop do
      decision = gets.chomp.upcase
      break if VALID_DECISIONS.include?(decision)
      prompt 'Please enter either "H" to hit or "S" to stay.'
    end
    break if decision == 'S'
    hit!(deck, hands, 'player')
  end
  loop do
    break if bust_or_blackjack?(player_score)
    dealer_score = count_score(hands['dealer'])
    prompt "The dealer's hand is #{display_hand(hands['dealer'])}\
    (Total #{dealer_score})"
    break if bust_or_blackjack?(dealer_score)
    if dealer_score >= 17
      break
    else
      hit!(deck, hands, 'dealer')
    end
  end

  player_status = detect_bust_or_blackjack(player_score)
  dealer_status = detect_bust_or_blackjack(dealer_score)

  if player_status == 'bust'
    prompt "You busted!"
  elsif player_status == 'blackjack'
    prompt "You got Blackjack!"
  elsif dealer_status == 'bust'
    prompt "Dealer busted!"
  elsif dealer_status == 'blackjack'
    prompt "Dealer got Blackjack!"
  elsif player_score > dealer_score
    prompt "You beat the dealer!"
  else
    prompt "The dealer beat you."
  end

  prompt "Would you like to play another game of 21?"
  answer = gets.chomp
  break unless answer.downcase == 'y'
end
