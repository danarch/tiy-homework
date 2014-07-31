require "minitest/autorun"

require "./guessinggame"


describe GuessingGame do
  it "isn't finished when it starts" do
    game = GuessingGame.new
    assert game.finished? == false
  end

  it "can be won by guessing the number" do
    game = GuessingGame.new(7)
    game.guess(7)
    assert game.finished? == true
    assert game.won? == true
  end

  it "gives you a hint if the guess is wrong" do
    game = GuessingGame.new(15)
    hint = game.guess(10)
    assert_equal hint, "Your guess is too low"
  end

  it "counts down the tries" do
    game = GuessingGame.new(21)
    assert_equal game.tries_left, 5
    game.guess(7)
    assert_equal game.tries_left, 4
  end

  it "is lost if you run out of guesses" do
    game = GuessingGame.new(25)
    5.times game.guess(rand(24))
    assert_equal game.tries_left, 0
    assert_equal game.won? == false
  end
end
