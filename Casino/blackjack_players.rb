require "./rubycards/lib/rubycards"

class Person
  def initialize
    @hands = {}
  end
  def score hand
    hand.sort!
    sum = 0
    hand.each do |card|
      if card.rank != :A
        sum += card.value
      else
        if sum > 11
          sum += 1
        else
          sum += 11
        end
      end
    end
  end
  def busted? hand
    self.score(hand) > 21
  end
  def blackjack? hand
    hand.size == 2 && self.score(hand) == 21
  end
end
class Player <Person
  include Enumerable
  attr_accessor :hands, :chips
  def initialize name, chips
    @name = name
    @chips = chips
    super
  end
  def each
    @hands.each_key {|hand| yield hand}
  end
  def bet amount, hand
    @hands[hand] = amount
    @chips -= amount
  end
  def can_play?
    @chips > 0
  end
  def win_hand (hand, odds=1)
    @chips += @hands[hand] * odds
  end
  def lose_hand (hand)
    @chips -= @hands[hand]
  end
end
class Dealer <Person
  def initialize
    @deck = Deck.new
    super
  end
  def shuffle
    deck.shuffle!
  end
  def deal(*plyrs)
    plyrs.each do |person, blind|
      hand = Hand.new
      person.hands[hand] = 0
      person.hands[hand].add(deck.draw)
      person.hands[hand].add(deck.draw)
    end
  end
  def hit person, hand
    person.hands[hand].add(deck.draw)
  end
  def split person, hand
    card1 = hand.cards[0]
    card2 = hand.cards[1]
    bet = person.hands[hand].delete
    fsthand = Hand.new
    fsthand << card1
    sechand = Hand.new
    sechand << card2
    person.hands[fsthand] = bet
    person.hands[sechand] = bet
    hit(person, sechand)
    hit(person, fsthand)
  end
  def double person, hand
    person.hands[hand].value * 2
    person.hands[hand].add(deck.draw)
  end
  def should_hit?
    self.score(hand) > 17
  end
end
