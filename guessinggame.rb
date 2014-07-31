class GuessingGame
  #make a guess
  #track guesses
  def initialize(answer=nil)
   @answer = answer || (0..100).to_a.sample
   @guesses = 5
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
