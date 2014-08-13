# Provides the `ask` helper function
# You'll need to `gem install highline` to use this
require "highline/import"

require "./blackjack_players"

class Blackjack
  attr_reader :dealer, :players

  def initialize num = 1
    @dealer = Dealer.new
    @players = []
    num.times do |num|
      @players[num-1] = Player.new
  end

  def play
    while players.empty? == false
      play_round
      break if new_round == "n"
    end
    puts "Thank you for playing!"
    @players.each_with_index do |player, i|
      puts "Player #{ i+1 } you leave with $#{player.chips}!"
    end
  end

  def new_round
    ask 'Would you like to play another round? (y/n) ' do |question|
      question.in = %w(y n) # words shortcut ["y", "n"]
    end
  end

  def make_choice player, hand
    if player.hands.hand.size == 1
      player.hands.hand.add(deck.draw)
    end
    if player.hands[hand].size == 2 && hand.cards[0].rank == hand.cards[1].rank
      ask 'Do you want to hit, split, double, or stand? ' do |question|
      question.in = %w(hit split double stand)
      end
    else
      ask 'Do you want to hit, double, or stand? ' do |question|
      question.in = %w(hit double stand)
    end
  end

  def ask_for_bet(player)
    ask "How much do you want to bet? (max $#{player.money}) ", Integer do |question|
      question.default = 10
      question.in = (10..player.money)
    end
  end

  def hand_win(player, hand)
    if player.blackjack?(hand)
      puts 'You have a blackjack and win at 3:2!'
      player.win_hand(hand, 1.5)
    else
      puts 'You won the hand!'
      player.win_hand(hand)
    end
  end

  def hand_lose(player, hand, message='You lost the hand!')
    puts message
    player.lose_hand(hand)
  end

  def show_winners
    house_hand = dealer.hands.key(0)
    house_score = dealer.score(hands.key(0))
    @players.each do |player|
      player.hands.each do |hand|
        puts "The dealer scored #{house_score}."
        puts "You scored #{player.score(hand)} on this hand; #{player.score(hand)}."

        if house_score > player.score(hand)
          hand_lose(player, hand)
        elsif player.score(hand) > house_score
          hand_win(player, hand)
        else
          if dealer.blackjack?(house_hand) && !player.blackjack?(hand)
            hand_lose(player, hand, 'The dealer has blackjack. You lose!')
          elsif player.blackjack?(hand)
            hand_win(player, hand)
          else
            puts 'You tie and get your bet back.'
          end
        end
      end
    end
    new_round
  end

  def play_round
    puts "\n"
    blinds = []
    @players.each do |player|
      blinds << ask_for_bet(player)
    end
    dealer.shuffle!
    dealer.deal(dealer, players.each)
    i = 0
    @players.each do |player|
      player.hands[hand] = blinds[i]
      i += 1
      player.hands.each do |hand|
        puts "Dealer is showing #{dealer.hands.hand.showing}."
        puts "You have a hand of #{player.hands.hand}."
        while !player.busted?(hand)
          move = make_choice(player, hand)
          case move
          when 'hit'
            dealer.hit(player, hand)
            puts "You have a hand of #{player.hands.hand}."
            move = make_choice(player, hand) unless player.busted?(hand)
          when 'double'
            dealer.double(player, hand)
            puts "You have a hand of #{player.hands.hand}."
            break
          when 'split'
            dealer.split(player, hand)
            puts "You have a hand of #{player.hands.hand}"
            move = make_choice(player, hand) unless player.busted?(hand)
          when 'stand'
            break
          end
        end
        puts 'You busted!'
        player.lose_hand(hand)
        end
      end
    end
    while dealer.should_hit?
      puts 'The dealer hits.'
      dealer.hit(dealer)
      puts "The dealer has #{dealer.hand}."
    end

    if dealer.busted?
      puts 'The dealer busted!'
      player_win(bet)
      return
    else
      puts 'The dealer stands.'
    end

    # show final score and credit/debit player
    show_winners
  end
end
end
