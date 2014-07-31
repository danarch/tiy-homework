class GuessingGame
  #make a guess
  #track guesses
  def initialize(difficulty = 100, answer=nil)
    @difficulty = difficulty
   @answer = answer || (0..difficulty).to_a.sample
   @guesses = difficulty.fdiv(10).round
   @won= false
  end

  def guess(number)
    @tries_left -= 1

    if number == @answer
      @won = true
    elsif number < @answer
      "Your guess is too low"
    else
      "Your guess is too high"
    end
  end

  def finished?
    @guesses.zero? || @won
  end

  def won?
    @won
  end

  def tries_left
    @guesses
  end
 end
