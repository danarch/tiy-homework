class Card
  attr_reader :rank, :suit
  def initialize rank, suit
    @rank = rank
    @suit = suit
  end
end
class Deck
  Ranks = [2,3,4,5,6,7,8,9,10,"Jack", "Queen", "King", "Ace"]
  Suits = %w{Spade Diamond Club Heart}
  def initialize num = 1
    @crdsleft = []
    @crdsdrwn = []
    crds = Ranks * num
    crds.product(Suits).each do |rank, suit|
      @crdsleft << Card.new(rank, suit)
    end
  end
  def shuffle!
    @cards.shuffle!
    self
  end
  def draw
    card = @cards.shift
    @crdsdrwn << card
  end
end
