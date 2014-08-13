require "minitest/autorun"

require "./hangman"

describe Hangman do
  it "isn't finished when it starts" do
  game = Hangman.new ("The Iron Yard")
  assert_equal game.finished? == false
  end

  it "let's players make a guess" do
  game = Hangman.new("The Iron Yard")
  assert_equal game.guess("c"), false
  end

  it "removes letters from available letters after a guess" do
  game = Hangman.new("The Iron Yard")
  starting = game.available_letters
  game.guess(starting.first)
  assert_equal game.available_letters.count, starting.count - 1
  end

  it "only lets you guess from available letters" do
  game = Hangman.new("The Iron Yard")
  game.guess("x")
  assert_equal game.misses_remaining, 5
  game.guess("x")
  assert_equal game.misses_remaining, 5
  end

  it "is over when you make 6 bad guesses" do
  game = Hangman.new("up")
  ('a'..'f').each { |letter| game.guess(letter)}
  assert_equal game.finished?, true
  assert_equal game.lost?, true
  end

  it "can be solved by guessing the word" do
  game = Hangman.new("up")
  game.guess("u")
  game.guess("p")
  assert_equal game.won?
  end

  it "displays the current board" do
  game = Hangman.new("banana")
  game.guess("a")
  assert_equal "_a_a_a", game.board
  end

  it "is case insensitive" do
  game = Hangman.new("banana")
  game.guess("A")
  assert_equal "_a_a_a", game.board
  end
end
