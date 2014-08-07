class Card
  attr_reader :rank, :suit
  include Comparable
  Ranks = [2,3,4,5,6,7,8,9,10, :J, :Q, :K, :A]
  Suits = %w{Spades Diamonds Clubs Hearts}
  def initialize rank, suit
    @rank = rank
    @suit = suit
  end
  def value
    case rank
    when :A
      14
    when :K
      13
    when :Q
      12
    when :J
      11
    else rank
  def <=>(other)
    if self.value == other.value
      case suit
      when "Spades"
        if other.suit == "Spades"
          0
        else
          1
        end
      when "Diamonds"
        if other.suit == "Spades"
          -1
        elsif other.suit == "Diamonds"
          0
        else
          1
        end
      when "Clubs"
        if other.suit == "Spades" || "Diamonds"
          -1
        elsif other.suit == "Clubs"
          0
        else
          1
        end
      when "Hearts"
        if other.suit == "Hearts"
          0
        else
          -1
        end
      end
    else
      self.value <=> other.value
    end
end

class Deck
  def initialize num = 1
    @cardsleft = []
    @cardsdrwn = []
    num.times do
      Ranks.product(Suits).each do |rank, suit|
        @cardsleft << Card.new(rank, suit)
      end
    end
  end
  def shuffle!
    @cardsleft += @cardsdrwn
    @cardsdrwn = []
    @cardsleft.shuffle!
  end
  def draw
    card = @crdsleft.shift
    @crdsdrwn << card
    card
  end
end

class Hand
  def initialize
    @cards = []
  end
  def add cards
    @cards << card
  end
  def value
    total = 0
    cds = @cards.sort
    cds.each do |x|
      if x.rank "Jack" || "Queen" || "King"
        total += 10
      elsif x.rank == "Ace"
        if total + 11 >21
          total += 1
        else
          total += 11
        end
      else
        total += x.rank
      end
    end
    total
  end
  def bust?
    if @value > 21 then
      true
    else
      false
    end
  end

  def split
    if @cards.size == 2 and @cards[0].rank == @cards[1].rank
      split = @cards.pop
      Hand.new.add(split)

    end
  end
  def blackjack?
    if @cards.size == 2 && value == 21
      true
    else
      false
    end
  end
end

class Person
  def initialize
    @hands = []
  end
end
class Player <Person
  def initialize buyin = 100
    @buyin = buyin
    super
  end

end
class Dealer <Person
  def initialize
    @deck = Deck.new
  end
  def shuffle
    deck.shuffle!
  end
  def deal(*person)
    people.each do |person|
      person.hands[0] = Hand.new
      person.hands[0].add(deck.draw)
      person.hands[0].add(deck.draw)
    end
  end
