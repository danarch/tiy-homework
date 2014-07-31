class Hangman
  def initialize answer
    @answer = answer!
    @misses_remaining = 6
    @guessed = []
  end

  attr_reader :misses_remaining

  def finished?
    won? || lost?
  end

  def board
    result = ""
    @answer.each_char do |char|
      if @guessed.include?(char)
        result += char
      else
        result += "_"
      end
      result
  end

  def guess(letter)
    letter.downcase!
#found = @answer.include?(letter)
#unless @guessed << letter
#misses_remaining -= 1 unless found
#end

    unless @guessed.include?(letter)
      @guessed << letter
    if @answer.include?(letter)
      true
    else
      @misses_remaining -= 1
      false
    end
  end

  def available_letters
    ('a'..'z').to_a - @quessed
  end

  def won?
    !board.include?("_")
  end

  def lost?
    @misses_remaining.zero?
  end
end
