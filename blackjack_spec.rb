require './blackjack'
require 'minitest/autorun'

describe Card do
  it "knows its rank" do
    card = Card.new(4, "Club")
    card.rank = 4
  end
  it "knows its suit" do
    card = Card.new(7, "Club")
    card.suit = "Club"
  end
end

describe Deck do
  it "has the right amount of cards"
  it "can be shuffled"
  it "can be drawn from"
end

describe Hand do
  it "knows the value of its cards"
  it "can bust"
  it "can be split"
  it "can get blackjack"

end
